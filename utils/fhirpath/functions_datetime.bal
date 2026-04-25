// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).

// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/time;

// ========================================
// DATE/TIME FUNCTIONS
// ========================================

isolated function applyTodayFunction(json[] collection, Expr[] params) returns FHIRPathInterpreterError|json[] {
    if params.length() != 0 {
        return fnError("today", "0 parameters", params.length());
    }
    time:Civil civil = time:utcToCivil(time:utcNow());
    string dateStr = string `@${civil.year}-${zeroPad(civil.month)}-${zeroPad(civil.day)}`;
    return [dateStr];
}

isolated function applyNowFunction(json[] collection, Expr[] params) returns FHIRPathInterpreterError|json[] {
    if params.length() != 0 {
        return fnError("now", "0 parameters", params.length());
    }
    time:Civil civil = time:utcToCivil(time:utcNow());
    int hour = civil.hour;
    int minute = civil.minute;
    decimal second = civil.second ?: 0d;
    string dtStr = string `@${civil.year}-${zeroPad(civil.month)}-${zeroPad(civil.day)}T${zeroPad(hour)}:${zeroPad(minute)}:${zeroPad(<int>second)}+00:00`;
    return [dtStr];
}

isolated function applyLowBoundaryFunction(json[] collection, Expr[] params, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    if params.length() > 1 {
        return fnError("lowBoundary", "0 or 1 parameter", params.length());
    }
    if collection.length() == 0 {
        return [];
    }
    json val = collection[0];
    int precision = 8; // default precision
    if params.length() == 1 {
        json[] precResult = check evaluate(params[0], context, env);
        if precResult.length() > 0 && precResult[0] is int {
            precision = <int>precResult[0];
        }
    }
    // For numeric values: low boundary is value - 5 * 10^-(precision+1)
    if val is decimal {
        decimal half = computeHalfUlp(val, precision);
        return [val - half];
    } else if val is int {
        return [val];
    }
    // For date strings: return the start of the implied period
    if val is string {
        return [dateTimeLowBoundary(val, precision)];
    }
    return [];
}

isolated function applyHighBoundaryFunction(json[] collection, Expr[] params, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    if params.length() > 1 {
        return fnError("highBoundary", "0 or 1 parameter", params.length());
    }
    if collection.length() == 0 {
        return [];
    }
    json val = collection[0];
    int precision = 8;
    if params.length() == 1 {
        json[] precResult = check evaluate(params[0], context, env);
        if precResult.length() > 0 && precResult[0] is int {
            precision = <int>precResult[0];
        }
    }
    if val is decimal {
        decimal half = computeHalfUlp(val, precision);
        return [val + half];
    } else if val is int {
        return [val];
    }
    if val is string {
        return [dateTimeHighBoundary(val, precision)];
    }
    return [];
}

isolated function applyPrecisionFunction(json[] collection, Expr[] params) returns FHIRPathInterpreterError|json[] {
    if params.length() != 0 {
        return fnError("precision", "0 parameters", params.length());
    }
    if collection.length() == 0 {
        return [];
    }
    json val = collection[0];
    if val is decimal {
        string s = val.toString();
        int? dotIdx = s.indexOf(".");
        if dotIdx is int {
            return [s.length() - dotIdx - 1];
        }
        return [0];
    } else if val is int {
        return [0];
    }
    // For date/time strings, precision is determined by the granularity
    if val is string {
        return [dateTimePrecision(val)];
    }
    return [];
}

// ========================================
// HELPERS
// ========================================

isolated function zeroPad(int n) returns string {
    string s = n.toString();
    return s.length() < 2 ? "0" + s : s;
}

isolated function computeHalfUlp(decimal val, int precision) returns decimal {
    // half unit in the last place = 5 * 10^-(precision+1)
    decimal factor = 5d;
    foreach int i in 0 ..< precision + 1 {
        factor = factor / 10d;
    }
    return factor;
}

isolated function dateTimeLowBoundary(string val, int precision) returns string {
    // Remove @ prefix if present
    string s = val.startsWith("@") ? val.substring(1) : val;
    // Return the start of the implied period at the given precision
    if s.length() == 4 {
        return "@" + s + "-01-01T00:00:00.000+00:00";
    } else if s.length() == 7 {
        return "@" + s + "-01T00:00:00.000+00:00";
    } else if s.length() == 10 {
        return "@" + s + "T00:00:00.000+00:00";
    }
    return val;
}

isolated function dateTimeHighBoundary(string val, int precision) returns string {
    string s = val.startsWith("@") ? val.substring(1) : val;
    if s.length() == 4 {
        return "@" + s + "-12-31T23:59:59.999+00:00";
    } else if s.length() == 7 {
        // Last day of month — simplified to 28 (conservative)
        return "@" + s + "-28T23:59:59.999+00:00";
    } else if s.length() == 10 {
        return "@" + s + "T23:59:59.999+00:00";
    }
    return val;
}

isolated function dateTimePrecision(string val) returns int {
    string s = val.startsWith("@") ? val.substring(1) : val;
    if s.startsWith("T") { s = s.substring(1); }
    // Date portion length determines precision
    if s.length() == 4 { return 4; }  // year
    if s.length() == 7 { return 6; }  // year-month
    if s.length() == 10 { return 8; } // year-month-day
    if s.includes("T") {
        // DateTime
        int? tIdx = s.indexOf("T");
        if tIdx is int {
            string timePart = s.substring(tIdx + 1);
            if timePart.length() >= 2 { return 10; }  // hours
            if timePart.length() >= 5 { return 12; }  // hours:minutes
            if timePart.length() >= 8 { return 14; }  // hours:minutes:seconds
        }
    }
    return 8;
}
