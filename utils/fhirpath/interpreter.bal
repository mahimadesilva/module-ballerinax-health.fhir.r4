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

// ========================================
// INTERPRETER FOR FHIRPATH EXPRESSIONS
// ========================================
// Tree-walking interpreter for the complete FHIRPath N1 normative grammar.

# Represents an interpreter runtime error with token information.
#
# + token - The token where the runtime error occurred
type InterpreterError record {|
    FhirPathToken token;
|};

# Error type for FHIRPath interpreter runtime errors.
type FHIRPathInterpreterError distinct error<InterpreterError>;

# Evaluation environment carrying $index, $total, and named variables.
#
# + index - Current iteration index ($index)
# + total - Running aggregate total ($total)
# + variables - Named variables defined via defineVariable()
type FhirPathEnv record {|
    int index?;
    json total?;
    map<json> variables?;
|};

// ========================================
// PUBLIC ENTRY POINTS
// ========================================

# Interprets a FHIRPath expression against a JSON context object.
#
# + expression - The parsed FHIRPath expression (AST)
# + context - The JSON context object (typically a FHIR resource)
# + return - A collection of JSON results, or a FhirpathInterpreterError if evaluation fails
isolated function interpret(Expr expression, json context) returns FHIRPathInterpreterError|json[] {
    return evaluate(expression, context, {});
}

# Evaluates a FHIRPath expression node against a context.
# Dispatches to the appropriate visitor function based on expression type.
#
# + expr - The expression node to evaluate
# + context - The current evaluation context (JSON value, serves as $this)
# + env - The evaluation environment ($index, $total, variables)
# + return - A collection of JSON results, or a FhirpathInterpreterError if evaluation fails
isolated function evaluate(Expr expr, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    match expr.kind {
        "Literal" => {
            return visitLiteralExpr(<LiteralExpr>expr, context);
        }
        "Identifier" => {
            return visitIdentifierExpr(<IdentifierExpr>expr, context, env);
        }
        "MemberAccess" => {
            return visitMemberAccessExpr(<MemberAccessExpr>expr, context, env);
        }
        "Indexer" => {
            return visitIndexerExpr(<IndexerExpr>expr, context, env);
        }
        "Function" => {
            return visitFunctionExpr(<FunctionExpr>expr, context, env);
        }
        "Binary" => {
            return visitBinaryExpr(<BinaryExpr>expr, context, env);
        }
        "Unary" => {
            return visitUnaryExpr(<UnaryExpr>expr, context, env);
        }
        "ExternalConstant" => {
            return visitExternalConstantExpr(<ExternalConstantExpr>expr, env);
        }
        "QuantityLiteral" => {
            return visitQuantityLiteralExpr(<QuantityLiteralExpr>expr);
        }
    }
    return [];
}

// ========================================
// VISITOR FUNCTIONS
// ========================================

isolated function visitLiteralExpr(LiteralExpr expr, json context) returns json[] {
    json value = <json>expr.value;
    if value is () {
        return [];
    }
    return [value];
}

isolated function visitIdentifierExpr(IdentifierExpr expr, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    // Special variables
    if expr.name == "$this" {
        return wrapInCollection(context);
    }
    if expr.name == "$index" {
        return [env.index ?: 0];
    }
    if expr.name == "$total" {
        json? total = env?.total;
        if total is () {
            return [];
        }
        return [total];
    }

    // Named variables defined by defineVariable()
    map<json>? variables = env.variables;
    if variables is map<json> && variables.hasKey(expr.name) {
        return wrapInCollection(variables[expr.name]);
    }

    if context is () {
        return [];
    }

    if context is map<json> {
        string fieldName = expr.name;

        // Check resource type match
        json|error resourceTypeValue = context.resourceType;
        if resourceTypeValue !is error && resourceTypeValue is string {
            if fieldName == resourceTypeValue {
                return [context];
            }
        }

        if !context.hasKey(fieldName) {
            return [];
        }
        json fieldValue = context[fieldName];
        return wrapInCollection(fieldValue);
    }

    return [];
}

isolated function visitMemberAccessExpr(MemberAccessExpr expr, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    json[] targetResults = check evaluate(expr.target, context, env);

    json[] results = [];
    foreach json item in targetResults {
        json[] memberResults = check accessMember(item, expr.member);
        foreach json memberValue in memberResults {
            results.push(memberValue);
        }
    }

    return results;
}

isolated function accessMember(json item, string memberName) returns FHIRPathInterpreterError|json[] {
    if item is () {
        return [];
    }
    if item is map<json> {
        if !item.hasKey(memberName) {
            return [];
        }
        json fieldValue = item[memberName];
        return wrapInCollection(fieldValue);
    }
    if item is json[] {
        json[] results = [];
        foreach json element in item {
            json[] elementResults = check accessMember(element, memberName);
            foreach json value in elementResults {
                results.push(value);
            }
        }
        return results;
    }
    return [];
}

isolated function visitIndexerExpr(IndexerExpr expr, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    json[] targetResults = check evaluate(expr.target, context, env);
    json[] indexResults = check evaluate(expr.index, context, env);

    if indexResults.length() != 1 {
        return [];
    }

    json indexValue = indexResults[0];
    int index;
    if indexValue is int {
        index = indexValue;
    } else if indexValue is decimal {
        index = <int>indexValue;
    } else if indexValue is float {
        if indexValue % 1.0 != 0.0 {
            return [];
        }
        index = <int>indexValue;
    } else {
        return [];
    }

    if index < 0 || index >= targetResults.length() {
        return [];
    }
    return wrapInCollection(targetResults[index]);
}

isolated function visitUnaryExpr(UnaryExpr expr, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    json[] operandResults = check evaluate(expr.operand, context, env);
    if operandResults.length() == 0 {
        return [];
    }
    json val = operandResults[0];
    if expr.operator.tokenType == MINUS {
        if val is int { return [-val]; }
        if val is decimal { return [-val]; }
        if val is float { return [-val]; }
    }
    // PLUS is a no-op
    return [val];
}

isolated function visitExternalConstantExpr(ExternalConstantExpr expr, FhirPathEnv env) returns json[] {
    // Look up in variables if available
    map<json>? variables = env.variables;
    if variables is map<json> && variables.hasKey(expr.name) {
        return wrapInCollection(variables[expr.name]);
    }
    return [];
}

isolated function visitQuantityLiteralExpr(QuantityLiteralExpr expr) returns json[] {
    // Represent as a map with value and unit for quantity arithmetic
    return [{"value": expr.value, "unit": expr.unit}];
}

// ========================================
// BINARY EXPRESSION
// ========================================

isolated function visitBinaryExpr(BinaryExpr expr, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    TokenType operatorType = expr.operator.tokenType;

    // IS and AS: don't evaluate the right side as a value; it's a type name
    if operatorType == IS {
        json[] leftResults = check evaluate(expr.left, context, env);
        string typeName = extractTypeName(expr.right);
        if leftResults.length() == 0 { return [false]; }
        return [matchesFhirType(leftResults[0], typeName)];
    }
    if operatorType == AS {
        json[] leftResults = check evaluate(expr.left, context, env);
        string typeName = extractTypeName(expr.right);
        json[] result = [];
        foreach json item in leftResults {
            if matchesFhirType(item, typeName) {
                result.push(item);
            }
        }
        return result;
    }

    // Short-circuit evaluation for logical operators
    if operatorType == AND {
        json[] leftResults = check evaluate(expr.left, context, env);
        if leftResults.length() > 0 && !isTruthy(leftResults) {
            return [false];
        }
        json[] rightResults = check evaluate(expr.right, context, env);
        return applyAndOperator(leftResults, rightResults);
    }
    if operatorType == OR {
        json[] leftResults = check evaluate(expr.left, context, env);
        if leftResults.length() > 0 && isTruthy(leftResults) {
            return [true];
        }
        json[] rightResults = check evaluate(expr.right, context, env);
        return applyOrOperator(leftResults, rightResults);
    }
    if operatorType == IMPLIES {
        json[] leftResults = check evaluate(expr.left, context, env);
        // false implies X = true; empty implies X = unknown
        if leftResults.length() > 0 && !isTruthy(leftResults) {
            return [true];
        }
        json[] rightResults = check evaluate(expr.right, context, env);
        return applyImpliesOperator(leftResults, rightResults);
    }

    json[] leftResults = check evaluate(expr.left, context, env);
    json[] rightResults = check evaluate(expr.right, context, env);

    match operatorType {
        EQUAL => { return applyEqualityOperator(leftResults, rightResults, true); }
        BANG_EQUAL => { return applyEqualityOperator(leftResults, rightResults, false); }
        TILDE => { return applyEquivalenceOperator(leftResults, rightResults, true); }
        BANG_TILDE => { return applyEquivalenceOperator(leftResults, rightResults, false); }
        XOR => { return applyXorOperator(leftResults, rightResults); }
        LESS_THAN => { return applyComparisonOperator(leftResults, rightResults, "<"); }
        GREATER_THAN => { return applyComparisonOperator(leftResults, rightResults, ">"); }
        LESS_EQUAL => { return applyComparisonOperator(leftResults, rightResults, "<="); }
        GREATER_EQUAL => { return applyComparisonOperator(leftResults, rightResults, ">="); }
        PLUS => { return applyAdditiveOperator(leftResults, rightResults, "+"); }
        MINUS => { return applyAdditiveOperator(leftResults, rightResults, "-"); }
        AMPERSAND => { return applyConcatenateOperator(leftResults, rightResults); }
        STAR => { return applyMultiplicativeOperator(leftResults, rightResults, "*"); }
        SLASH => { return applyMultiplicativeOperator(leftResults, rightResults, "/"); }
        DIV => { return applyMultiplicativeOperator(leftResults, rightResults, "div"); }
        MOD => { return applyMultiplicativeOperator(leftResults, rightResults, "mod"); }
        PIPE => { return applyUnionOperator(leftResults, rightResults); }
        IN => { return applyInOperator(leftResults, rightResults); }
        CONTAINS => { return applyInOperator(rightResults, leftResults); }
    }

    return error FHIRPathInterpreterError(string `Unknown binary operator: ${expr.operator.lexeme}`,
        token = expr.operator);
}

# Extracts the type name string from a type expression right-hand side.
isolated function extractTypeName(Expr expr) returns string {
    if expr is IdentifierExpr {
        return expr.name;
    }
    if expr is LiteralExpr && expr.value is string {
        return <string>expr.value;
    }
    return "";
}

// ========================================
// OPERATOR IMPLEMENTATIONS
// ========================================

isolated function applyEqualityOperator(json[] left, json[] right, boolean checkEqual) returns json[] {
    if left.length() == 0 || right.length() == 0 {
        return [];
    }
    if left.length() == 1 && right.length() == 1 {
        boolean areEqual = jsonValuesEqual(left[0], right[0]);
        return checkEqual ? [areEqual] : [!areEqual];
    }
    if left.length() == right.length() {
        boolean allEqual = true;
        foreach int i in 0 ..< left.length() {
            if !jsonValuesEqual(left[i], right[i]) {
                allEqual = false;
                break;
            }
        }
        return checkEqual ? [allEqual] : [!allEqual];
    }
    return [!checkEqual];
}

isolated function applyEquivalenceOperator(json[] left, json[] right, boolean checkEquivalent) returns json[] {
    if left.length() == 0 && right.length() == 0 {
        return [checkEquivalent];
    }
    if left.length() == 0 || right.length() == 0 {
        return [!checkEquivalent];
    }
    if left.length() != right.length() {
        return [!checkEquivalent];
    }
    boolean allEquiv = true;
    foreach int i in 0 ..< left.length() {
        if !jsonValuesEquivalent(left[i], right[i]) {
            allEquiv = false;
            break;
        }
    }
    return checkEquivalent ? [allEquiv] : [!allEquiv];
}

isolated function applyAndOperator(json[] left, json[] right) returns json[] {
    boolean leftEmpty = left.length() == 0;
    boolean rightEmpty = right.length() == 0;

    if (!leftEmpty && !isTruthy(left)) || (!rightEmpty && !isTruthy(right)) {
        return [false];
    }
    if leftEmpty || rightEmpty {
        return [];
    }
    return [true];
}

isolated function applyOrOperator(json[] left, json[] right) returns json[] {
    boolean leftEmpty = left.length() == 0;
    boolean rightEmpty = right.length() == 0;

    if (!leftEmpty && isTruthy(left)) || (!rightEmpty && isTruthy(right)) {
        return [true];
    }
    if leftEmpty || rightEmpty {
        return [];
    }
    return [false];
}

isolated function applyXorOperator(json[] left, json[] right) returns json[] {
    if left.length() == 0 || right.length() == 0 {
        return [];
    }
    return [isTruthy(left) != isTruthy(right)];
}

isolated function applyImpliesOperator(json[] left, json[] right) returns json[] {
    boolean leftEmpty = left.length() == 0;
    boolean rightEmpty = right.length() == 0;

    // false implies X = true
    if !leftEmpty && !isTruthy(left) {
        return [true];
    }
    // empty implies false = empty; empty implies empty = empty
    if leftEmpty {
        if rightEmpty { return []; }
        if isTruthy(right) { return [true]; }
        return [];
    }
    // true implies X
    if rightEmpty { return []; }
    return [isTruthy(right)];
}

isolated function applyComparisonOperator(json[] left, json[] right, string op) returns json[] {
    if left.length() == 0 || right.length() == 0 {
        return [];
    }
    json l = left[0];
    json r = right[0];

    // Numeric comparison
    if (l is int || l is decimal || l is float) && (r is int || r is decimal || r is float) {
        float lf = toFloat(l);
        float rf = toFloat(r);
        if op == "<" { return [lf < rf]; }
        if op == ">" { return [lf > rf]; }
        if op == "<=" { return [lf <= rf]; }
        if op == ">=" { return [lf >= rf]; }
    }

    // String comparison
    if l is string && r is string {
        if op == "<" { return [l < r]; }
        if op == ">" { return [l > r]; }
        if op == "<=" { return [l <= r]; }
        if op == ">=" { return [l >= r]; }
    }

    // Date/time comparison (lexicographic on @YYYY-MM-DD... strings)
    if l is string && r is string {
        string ls = l.startsWith("@") ? l : l;
        string rs = r.startsWith("@") ? r : r;
        if op == "<" { return [ls < rs]; }
        if op == ">" { return [ls > rs]; }
        if op == "<=" { return [ls <= rs]; }
        if op == ">=" { return [ls >= rs]; }
    }

    return [];
}

isolated function applyAdditiveOperator(json[] left, json[] right, string op) returns json[] {
    if left.length() == 0 || right.length() == 0 {
        return [];
    }
    json l = left[0];
    json r = right[0];

    if op == "+" {
        if l is string && r is string {
            return [l + r];
        }
        if (l is int || l is decimal || l is float) && (r is int || r is decimal || r is float) {
            return numericBinaryOp(l, r, "+");
        }
    } else if op == "-" {
        if (l is int || l is decimal || l is float) && (r is int || r is decimal || r is float) {
            return numericBinaryOp(l, r, "-");
        }
    }
    return [];
}

isolated function applyConcatenateOperator(json[] left, json[] right) returns json[] {
    // & always concatenates strings; empty collection treated as ""
    string lStr = left.length() > 0 ? jsonToString(left[0]) : "";
    string rStr = right.length() > 0 ? jsonToString(right[0]) : "";
    return [lStr + rStr];
}

isolated function applyMultiplicativeOperator(json[] left, json[] right, string op) returns json[] {
    if left.length() == 0 || right.length() == 0 {
        return [];
    }
    json l = left[0];
    json r = right[0];

    if (l is int || l is decimal || l is float) && (r is int || r is decimal || r is float) {
        return numericBinaryOp(l, r, op);
    }
    return [];
}

isolated function applyUnionOperator(json[] left, json[] right) returns json[] {
    json[] combined = [...left, ...right];
    return applyDistinctToItems(combined);
}

isolated function applyInOperator(json[] left, json[] right) returns json[] {
    if left.length() == 0 {
        return [];
    }
    if right.length() == 0 {
        return [false];
    }
    // Each element of left must be in right
    // For single-element left: true if left[0] is in right
    if left.length() == 1 {
        foreach json item in right {
            if jsonValuesEqual(left[0], item) {
                return [true];
            }
        }
        return [false];
    }
    // For multi-element left: check if all elements are in right
    foreach json leftItem in left {
        boolean found = false;
        foreach json rightItem in right {
            if jsonValuesEqual(leftItem, rightItem) {
                found = true;
                break;
            }
        }
        if !found {
            return [false];
        }
    }
    return [true];
}

// ========================================
// FUNCTION CALL DISPATCHER
// ========================================

isolated function visitFunctionExpr(FunctionExpr expr, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    json[] targetResults;
    Expr? targetExpr = expr.target;
    if targetExpr is Expr {
        targetResults = check evaluate(targetExpr, context, env);
    } else {
        targetResults = wrapInCollection(context);
    }

    string name = expr.name;
    Expr[] params = expr.params;

    // ---- Existence ----
    if name == "empty" { return applyEmptyFunction(targetResults, params); }
    if name == "exists" { return applyExistsFunction(targetResults, params, context, env); }
    if name == "not" { return applyNotFunction(targetResults, params); }
    if name == "hasValue" { return applyHasValueFunction(targetResults, params); }

    // ---- Navigation ----
    if name == "where" { return applyWhereFunction(targetResults, params, context, env); }
    if name == "select" { return applySelectFunction(targetResults, params, context, env); }
    if name == "repeat" { return applyRepeatFunction(targetResults, params, context, env); }
    if name == "children" { return applyChildrenFunction(targetResults, params, context); }
    if name == "descendants" { return applyDescendantsFunction(targetResults, params, context); }

    // ---- Subsetting ----
    if name == "first" { return applyFirstFunction(targetResults, params); }
    if name == "last" { return applyLastFunction(targetResults, params); }
    if name == "tail" { return applyTailFunction(targetResults, params); }
    if name == "skip" { return applySkipFunction(targetResults, params, context, env); }
    if name == "take" { return applyTakeFunction(targetResults, params, context, env); }
    if name == "single" { return applySingleFunction(targetResults, params); }

    // ---- Aggregation ----
    if name == "count" { return applyCountFunction(targetResults, params); }
    if name == "distinct" { return applyDistinctFunction(targetResults, params); }
    if name == "all" { return applyAllFunction(targetResults, params, context, env); }
    if name == "aggregate" { return applyAggregateFunction(targetResults, params, context, env); }
    if name == "sum" { return applySumFunction(targetResults, params); }

    // ---- Combining ----
    if name == "combine" { return applyCombineFunction(targetResults, params, context, env); }
    if name == "union" { return applyUnionFunction(targetResults, params, context, env); }
    if name == "intersect" { return applyIntersectFunction(targetResults, params, context, env); }
    if name == "exclude" { return applyExcludeFunction(targetResults, params, context, env); }
    if name == "subsetOf" { return applySubsetOfFunction(targetResults, params, context, env); }
    if name == "supersetOf" { return applySupersetOfFunction(targetResults, params, context, env); }

    // ---- Ordering ----
    if name == "sort" { return applySortFunction(targetResults, params, context, env); }

    // ---- Math ----
    if name == "abs" { return applyAbsFunction(targetResults, params); }
    if name == "ceiling" { return applyCeilingFunction(targetResults, params); }
    if name == "floor" { return applyFloorFunction(targetResults, params); }
    if name == "truncate" { return applyTruncateFunction(targetResults, params); }
    if name == "round" { return applyRoundFunction(targetResults, params, context, env); }
    if name == "sqrt" { return applySqrtFunction(targetResults, params); }
    if name == "power" { return applyPowerFunction(targetResults, params, context, env); }
    if name == "exp" { return applyExpFunction(targetResults, params); }
    if name == "ln" { return applyLnFunction(targetResults, params); }
    if name == "log" { return applyLogFunction(targetResults, params, context, env); }

    // ---- String ----
    if name == "length" { return applyLengthFunction(targetResults, params); }
    if name == "trim" { return applyTrimFunction(targetResults, params); }
    if name == "toChars" { return applyToCharsFunction(targetResults, params); }
    if name == "split" { return applySplitFunction(targetResults, params, context, env); }
    if name == "join" { return applyJoinFunction(targetResults, params, context, env); }
    if name == "startsWith" { return applyStartsWithFunction(targetResults, params, context, env); }
    if name == "endsWith" { return applyEndsWithFunction(targetResults, params, context, env); }
    if name == "contains" {
        // String contains (single-arg): different from collection 'in/contains'
        if params.length() == 1 {
            return applyContainsStringFunction(targetResults, params, context, env);
        }
        // No-arg contains() is an error
        return fnError("contains", "1 parameter", params.length());
    }
    if name == "indexOf" { return applyIndexOfFunction(targetResults, params, context, env); }
    if name == "substring" { return applySubstringFunction(targetResults, params, context, env); }
    if name == "replace" { return applyReplaceFunction(targetResults, params, context, env); }
    if name == "matches" { return applyMatchesFunction(targetResults, params, context, env); }
    if name == "matchesFull" { return applyMatchesFullFunction(targetResults, params, context, env); }
    if name == "replaceMatches" { return applyReplaceMatchesFunction(targetResults, params, context, env); }
    if name == "encode" { return applyEncodeDecodeFunction("encode", targetResults, params, context, env); }
    if name == "decode" { return applyEncodeDecodeFunction("decode", targetResults, params, context, env); }
    if name == "escape" { return applyEscapeUnescapeFunction("escape", targetResults, params, context, env); }
    if name == "unescape" { return applyEscapeUnescapeFunction("unescape", targetResults, params, context, env); }

    // ---- Type conversion ----
    if name == "toInteger" { return applyToIntegerFunction(targetResults, params); }
    if name == "toDecimal" { return applyToDecimalFunction(targetResults, params); }
    if name == "toString" { return applyToStringFunction(targetResults, params); }
    if name == "toBoolean" { return applyToBooleanFunction(targetResults, params); }
    if name == "toDate" { return applyToDateFunction(targetResults, params); }
    if name == "toDateTime" { return applyToDateTimeFunction(targetResults, params); }
    if name == "toTime" { return applyToTimeFunction(targetResults, params); }
    if name == "convertsToInteger" { return applyConvertsToIntegerFunction(targetResults, params); }
    if name == "convertsToDecimal" { return applyConvertsToDecimalFunction(targetResults, params); }
    if name == "convertsToString" { return applyConvertsToStringFunction(targetResults, params); }
    if name == "convertsToBoolean" { return applyConvertsToBooleanFunction(targetResults, params); }
    if name == "convertsToDate" { return applyConvertsToDateFunction(targetResults, params); }
    if name == "convertsToDateTime" { return applyConvertsToDateTimeFunction(targetResults, params); }
    if name == "convertsToTime" { return applyConvertsToTimeFunction(targetResults, params); }
    if name == "ofType" { return applyOfTypeFunction(targetResults, params, context, env); }
    if name == "is" { return applyIsTypeFunction(targetResults, params, context, env); }
    if name == "as" { return applyAsTypeFunction(targetResults, params, context, env); }

    // ---- Logic ----
    if name == "iif" { return applyIifFunction(targetResults, params, context, env); }

    // ---- Date/time ----
    if name == "today" { return applyTodayFunction(targetResults, params); }
    if name == "now" { return applyNowFunction(targetResults, params); }
    if name == "lowBoundary" { return applyLowBoundaryFunction(targetResults, params, context, env); }
    if name == "highBoundary" { return applyHighBoundaryFunction(targetResults, params, context, env); }
    if name == "precision" { return applyPrecisionFunction(targetResults, params); }

    // ---- FHIR-specific ----
    if name == "extension" { return applyExtensionFunction(targetResults, params, context, env); }
    if name == "resolve" { return applyResolveFunction(targetResults, params); }
    if name == "conformsTo" { return applyConformsToFunction(targetResults, params, context, env); }
    if name == "memberOf" { return applyMemberOfFunction(targetResults, params, context, env); }
    if name == "hasExtension" { return applyHasExtensionFunction(targetResults, params, context, env); }

    // ---- Utility ----
    if name == "trace" { return applyTraceFunction(targetResults, params, context, env); }
    if name == "defineVariable" { return applyDefineVariableFunction(targetResults, params, context, env); }

    // ---- Type casting (function form) ----
    if name == "ofType" { return applyOfTypeFunction(targetResults, params, context, env); }

    return error FHIRPathInterpreterError(string `Unknown function '${name}'`,
        token = {tokenType: IDENTIFIER, lexeme: name, literal: (), position: 0});
}

// ========================================
// CORE FUNCTION IMPLEMENTATIONS
// ========================================

isolated function applyWhereFunction(json[] collection, Expr[] params, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    if params.length() != 1 {
        return error FHIRPathInterpreterError(
            string `where() requires exactly 1 parameter, got ${params.length()}`,
            token = {tokenType: IDENTIFIER, lexeme: "where", literal: (), position: 0});
    }

    Expr conditionExpr = params[0];
    json[] results = [];
    int i = 0;

    foreach json item in collection {
        FhirPathEnv itemEnv = {index: i, total: env?.total, variables: env?.variables};
        json[] conditionResult = check evaluate(conditionExpr, item, itemEnv);
        if isTruthy(conditionResult) {
            results.push(item);
        }
        i += 1;
    }

    return results;
}

isolated function applyEmptyFunction(json[] collection, Expr[] params) returns FHIRPathInterpreterError|json[] {
    if params.length() != 0 {
        return error FHIRPathInterpreterError(
            string `empty() requires 0 parameters, got ${params.length()}`,
            token = {tokenType: IDENTIFIER, lexeme: "empty", literal: (), position: 0});
    }
    return [collection.length() == 0];
}

isolated function applyExistsFunction(json[] collection, Expr[] params, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    if params.length() > 1 {
        return error FHIRPathInterpreterError(
            string `exists() requires 0 or 1 parameter, got ${params.length()}`,
            token = {tokenType: IDENTIFIER, lexeme: "exists", literal: (), position: 0});
    }

    if params.length() == 0 {
        return [collection.length() > 0];
    }

    Expr criteriaExpr = params[0];
    int i = 0;
    foreach json item in collection {
        FhirPathEnv itemEnv = {index: i, total: env?.total, variables: env?.variables};
        json[] criteriaResult = check evaluate(criteriaExpr, item, itemEnv);
        if isTruthy(criteriaResult) {
            return [true];
        }
        i += 1;
    }

    return [false];
}

isolated function applyFirstFunction(json[] collection, Expr[] params) returns FHIRPathInterpreterError|json[] {
    if params.length() != 0 {
        return error FHIRPathInterpreterError(
            string `first() requires 0 parameters, got ${params.length()}`,
            token = {tokenType: IDENTIFIER, lexeme: "first", literal: (), position: 0});
    }
    if collection.length() == 0 {
        return [];
    }
    return [collection[0]];
}

isolated function applySumFunction(json[] collection, Expr[] params) returns FHIRPathInterpreterError|json[] {
    if collection.length() == 0 {
        return [0];
    }
    decimal sum = 0d;
    boolean hasDecimal = false;
    boolean hasInt = false;
    foreach json item in collection {
        if item is int { sum += <decimal>item; hasInt = true; }
        else if item is decimal { sum += item; hasDecimal = true; }
        else if item is float { sum += <decimal>item; hasDecimal = true; }
    }
    if hasDecimal {
        return [sum];
    }
    return [<int>sum];
}

isolated function applyDefineVariableFunction(json[] collection, Expr[] params, json context, FhirPathEnv env) returns FHIRPathInterpreterError|json[] {
    if params.length() < 1 || params.length() > 2 {
        return fnError("defineVariable", "1 or 2 parameters", params.length());
    }
    json[] nameResult = check evaluate(params[0], context, env);
    if nameResult.length() == 0 {
        return collection;
    }
    // The variable name is the first param evaluated as a string
    // (or just the identifier name if it's an IdentifierExpr)
    string varName = "";
    json nameVal = nameResult[0];
    if nameVal is string {
        varName = nameVal;
    } else {
        Expr param0 = params[0];
        if param0 is IdentifierExpr {
            varName = param0.name;
        }
    }

    json varValue = context;
    if params.length() == 2 {
        json[] valResult = check evaluate(params[1], context, env);
        if valResult.length() > 0 {
            varValue = valResult[0];
        }
    }

    // defineVariable returns the original collection unchanged; the variable
    // is stored in the env — but since env is immutable in this design, we
    // encode the variable into subsequent evaluation by returning the collection
    // (defineVariable is a side-effect operation; full support requires env mutation)
    return collection;
}

// ========================================
// UTILITY FUNCTIONS
// ========================================

isolated function isTruthy(json[] result) returns boolean {
    if result.length() == 0 {
        return false;
    }
    if result.length() == 1 && result[0] is boolean {
        return <boolean>result[0];
    }
    return true;
}

isolated function wrapInCollection(json value) returns json[] {
    if value is () {
        return [];
    }
    if value is json[] {
        return value;
    }
    return [value];
}

isolated function jsonValuesEqual(json a, json b) returns boolean {
    if a is () && b is () { return true; }
    if a is () || b is () { return false; }
    if a is boolean && b is boolean { return a == b; }
    if a is string && b is string { return a == b; }
    if (a is int || a is decimal || a is float) && (b is int || b is decimal || b is float) {
        return toFloat(a) == toFloat(b);
    }
    return a.toString() == b.toString();
}

isolated function jsonValuesEquivalent(json a, json b) returns boolean {
    if a is () && b is () { return true; }
    if a is () || b is () { return false; }
    if a is boolean && b is boolean { return a == b; }
    if a is string && b is string {
        return a.toLowerAscii() == b.toLowerAscii();
    }
    if (a is int || a is decimal || a is float) && (b is int || b is decimal || b is float) {
        return toFloat(a) == toFloat(b);
    }
    return a.toString().toLowerAscii() == b.toString().toLowerAscii();
}

isolated function isEqual(anydata a, anydata b) returns boolean {
    if a is () && b is () { return true; }
    if a is () || b is () { return false; }
    return a == b;
}

isolated function jsonToString(json val) returns string {
    if val is string { return val; }
    if val is () { return ""; }
    return val.toString();
}

isolated function numericBinaryOp(json l, json r, string op) returns json[] {
    boolean useDecimal = (l is decimal || r is decimal);
    boolean useInt = (l is int && r is int) && (op == "div" || op == "mod");

    if useInt || (!useDecimal && op == "div") {
        int li = l is int ? l : <int>toFloat(l);
        int ri = r is int ? r : <int>toFloat(r);
        if op == "div" {
            if ri == 0 { return []; }
            return [li / ri];
        }
        if op == "mod" {
            if ri == 0 { return []; }
            return [li % ri];
        }
    }

    if l is int && r is int {
        if op == "+" { return [l + r]; }
        if op == "-" { return [l - r]; }
        if op == "*" { return [l * r]; }
        if op == "/" {
            if r == 0 { return []; }
            decimal result = <decimal>l / <decimal>r;
            return [result];
        }
        if op == "div" { if r == 0 { return []; } return [l / r]; }
        if op == "mod" { if r == 0 { return []; } return [l % r]; }
    }

    decimal ld = l is decimal ? l : <decimal>toFloat(l);
    decimal rd = r is decimal ? r : <decimal>toFloat(r);

    if op == "+" { return [ld + rd]; }
    if op == "-" { return [ld - rd]; }
    if op == "*" { return [ld * rd]; }
    if op == "/" {
        if rd == 0d { return []; }
        return [ld / rd];
    }
    if op == "div" {
        if rd == 0d { return []; }
        return [<int>(ld / rd)];
    }
    if op == "mod" {
        if rd == 0d { return []; }
        return [ld % rd];
    }

    return [];
}

// ========================================
// SET INTERPRETER (setValuesToFhirPath)
// ========================================

# Interprets a FHIRPath expression to SET a value at the specified path.
#
# + expression - The parsed FHIRPath expression (AST)
# + context - The JSON context object (must be a map<json>)
# + newValue - The new value to set at the path
# + shouldRemove - Whether to remove the value instead of setting it
# + modificationFunction - Optional function to transform the existing value
# + return - The modified JSON context, or a FhirpathInterpreterError if evaluation fails
isolated function interpretSet(Expr expression, json context, json newValue, boolean shouldRemove, ModificationFunction? modificationFunction) returns FHIRPathInterpreterError|json {
    if context !is map<json> {
        return error FHIRPathInterpreterError("Context must be a JSON object for set operations",
            token = {tokenType: EOF, lexeme: "", literal: (), position: 0});
    }

    map<json> contextClone = context.clone();
    FHIRPathInterpreterError|map<json> result = evaluateSet(expression, contextClone, newValue, shouldRemove, modificationFunction);
    return result;
}

isolated function evaluateSet(Expr expr, map<json> context, json newValue, boolean shouldRemove, ModificationFunction? modificationFunction) returns FHIRPathInterpreterError|map<json> {
    match expr.kind {
        "Identifier" => {
            return visitIdentifierExprSet(<IdentifierExpr>expr, context, newValue, shouldRemove, modificationFunction);
        }
        "MemberAccess" => {
            return visitMemberAccessExprSet(<MemberAccessExpr>expr, context, newValue, shouldRemove, modificationFunction);
        }
        "Indexer" => {
            return visitIndexerExprSet(<IndexerExpr>expr, context, newValue, shouldRemove, modificationFunction);
        }
        _ => {
            return error FHIRPathInterpreterError("Unsupported expression type for set operation",
                token = {tokenType: EOF, lexeme: "", literal: (), position: 0});
        }
    }
}

isolated function visitIdentifierExprSet(IdentifierExpr expr, map<json> context, json newValue, boolean shouldRemove, ModificationFunction? modificationFunction) returns FHIRPathInterpreterError|map<json> {
    string fieldName = expr.name;

    json|error resourceTypeValue = context.resourceType;
    if resourceTypeValue !is error && resourceTypeValue is string {
        if fieldName == resourceTypeValue {
            return context;
        }
    }

    if shouldRemove {
        if context.hasKey(fieldName) {
            _ = context.remove(fieldName);
        }
        return context;
    }

    if !context.hasKey(fieldName) {
        return error FHIRPathInterpreterError(string `Path '${fieldName}' does not exist in the resource`,
            token = {tokenType: IDENTIFIER, lexeme: fieldName, literal: (), position: 0});
    }

    json|error modifiedValue = getModifiedValueInternal(context[fieldName], modificationFunction, newValue);
    if modifiedValue is error {
        return error FHIRPathInterpreterError(modifiedValue.message(),
            token = {tokenType: IDENTIFIER, lexeme: fieldName, literal: (), position: 0});
    }
    context[fieldName] = modifiedValue;

    return context;
}

isolated function visitMemberAccessExprSet(MemberAccessExpr expr, map<json> context, json newValue, boolean shouldRemove, ModificationFunction? modificationFunction) returns FHIRPathInterpreterError|map<json> {
    Expr targetExpr = expr.target;
    string memberName = expr.member;

    json[] targetResults = check evaluate(targetExpr, context, {});

    if targetResults.length() > 0 {
        foreach json targetItem in targetResults {
            if targetItem is map<json> {
                if shouldRemove {
                    if targetItem.hasKey(memberName) {
                        _ = targetItem.remove(memberName);
                    }
                } else {
                    if !targetItem.hasKey(memberName) {
                        return error FHIRPathInterpreterError(string `Path '${memberName}' does not exist in the resource`,
                            token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
                    }
                    json currentValue = targetItem[memberName];
                    json|error modifiedValue = getModifiedValueInternal(currentValue, modificationFunction, newValue);
                    if modifiedValue is error {
                        return error FHIRPathInterpreterError(modifiedValue.message(),
                            token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
                    }
                    targetItem[memberName] = modifiedValue;
                }
            } else if targetItem is json[] {
                foreach json element in targetItem {
                    if element is map<json> {
                        if shouldRemove {
                            if element.hasKey(memberName) {
                                _ = element.remove(memberName);
                            }
                        } else {
                            if !element.hasKey(memberName) {
                                return error FHIRPathInterpreterError(string `Path '${memberName}' does not exist in the resource`,
                                    token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
                            }
                            json currentValue = element[memberName];
                            json|error modifiedValue = getModifiedValueInternal(currentValue, modificationFunction, newValue);
                            if modifiedValue is error {
                                return error FHIRPathInterpreterError(modifiedValue.message(),
                                    token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
                            }
                            element[memberName] = modifiedValue;
                        }
                    }
                }
            }
        }
        return context;
    }

    if shouldRemove {
        return context;
    }
    return error FHIRPathInterpreterError(string `Path '${memberName}' does not exist in the resource`,
        token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
}

isolated function visitIndexerExprSet(IndexerExpr expr, map<json> context, json newValue, boolean shouldRemove, ModificationFunction? modificationFunction) returns FHIRPathInterpreterError|map<json> {
    json[] indexResults = check evaluate(expr.index, context, {});
    if indexResults.length() != 1 {
        return error FHIRPathInterpreterError("Index must be a single value",
            token = {tokenType: EOF, lexeme: "", literal: (), position: 0});
    }

    int index;
    json indexValue = indexResults[0];
    if indexValue is int {
        index = indexValue;
    } else if indexValue is decimal {
        index = <int>indexValue;
    } else if indexValue is float {
        if indexValue % 1.0 != 0.0 {
            return error FHIRPathInterpreterError("Index must be a whole number",
                token = {tokenType: EOF, lexeme: "", literal: (), position: 0});
        }
        index = <int>indexValue;
    } else {
        return error FHIRPathInterpreterError("Index must be numeric",
            token = {tokenType: EOF, lexeme: "", literal: (), position: 0});
    }

    Expr targetExpr = expr.target;

    if targetExpr is IdentifierExpr {
        return setValueAtIndexedIdentifier(targetExpr, index, context, newValue, shouldRemove, modificationFunction);
    } else if targetExpr is MemberAccessExpr {
        return setValueAtIndexedMemberAccess(targetExpr, index, context, newValue, shouldRemove, modificationFunction);
    } else if targetExpr is IndexerExpr {
        return setValueAtNestedIndexer(targetExpr, index, context, newValue, shouldRemove, modificationFunction);
    }

    return context;
}

isolated function setValueAtIndexedIdentifier(IdentifierExpr expr, int index, map<json> context, json newValue, boolean shouldRemove, ModificationFunction? modificationFunction) returns FHIRPathInterpreterError|map<json> {
    string fieldName = expr.name;

    if !context.hasKey(fieldName) {
        if shouldRemove { return context; }
        return error FHIRPathInterpreterError(string `Path '${fieldName}' does not exist in the resource`,
            token = {tokenType: IDENTIFIER, lexeme: fieldName, literal: (), position: 0});
    }

    json fieldValue = context[fieldName];
    if fieldValue !is json[] {
        if shouldRemove { return context; }
        return error FHIRPathInterpreterError(string `Path '${fieldName}' is not an array`,
            token = {tokenType: IDENTIFIER, lexeme: fieldName, literal: (), position: 0});
    }

    json[] arr = <json[]>fieldValue;

    if shouldRemove {
        if index >= 0 && index < arr.length() {
            json[] newArr = [];
            foreach int i in 0 ..< arr.length() {
                if i != index { newArr.push(arr[i]); }
            }
            context[fieldName] = newArr;
        }
        return context;
    }

    if index >= arr.length() {
        return error FHIRPathInterpreterError(string `Index ${index} is out of bounds for array '${fieldName}' with length ${arr.length()}`,
            token = {tokenType: IDENTIFIER, lexeme: fieldName, literal: (), position: 0});
    }

    json|error modifiedValue = getModifiedValueInternal(arr[index], modificationFunction, newValue);
    if modifiedValue is error {
        return error FHIRPathInterpreterError(modifiedValue.message(),
            token = {tokenType: IDENTIFIER, lexeme: fieldName, literal: (), position: 0});
    }
    arr[index] = modifiedValue;

    return context;
}

isolated function setValueAtIndexedMemberAccess(MemberAccessExpr expr, int index, map<json> context, json newValue, boolean shouldRemove, ModificationFunction? modificationFunction) returns FHIRPathInterpreterError|map<json> {
    json[] targetResults = check evaluate(expr.target, context, {});
    string memberName = expr.member;

    if targetResults.length() == 0 {
        if shouldRemove { return context; }
        return error FHIRPathInterpreterError(string `Path to '${memberName}' does not exist in the resource`,
            token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
    }

    foreach json targetItem in targetResults {
        if targetItem is map<json> {
            if !targetItem.hasKey(memberName) {
                if shouldRemove { continue; }
                return error FHIRPathInterpreterError(string `Path '${memberName}' does not exist`,
                    token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
            }

            json fieldValue = targetItem[memberName];
            if fieldValue !is json[] {
                if shouldRemove { continue; }
                return error FHIRPathInterpreterError(string `Path '${memberName}' is not an array`,
                    token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
            }

            json[] arr = <json[]>fieldValue;

            if shouldRemove {
                if index >= 0 && index < arr.length() {
                    json[] newArr = [];
                    foreach int i in 0 ..< arr.length() {
                        if i != index { newArr.push(arr[i]); }
                    }
                    targetItem[memberName] = newArr;
                }
                continue;
            }

            if index >= arr.length() {
                return error FHIRPathInterpreterError(string `Index ${index} is out of bounds for array '${memberName}' with length ${arr.length()}`,
                    token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
            }

            json|error modifiedValue = getModifiedValueInternal(arr[index], modificationFunction, newValue);
            if modifiedValue is error {
                return error FHIRPathInterpreterError(modifiedValue.message(),
                    token = {tokenType: IDENTIFIER, lexeme: memberName, literal: (), position: 0});
            }
            arr[index] = modifiedValue;
        }
    }

    return context;
}

isolated function setValueAtNestedIndexer(IndexerExpr expr, int outerIndex, map<json> context, json newValue, boolean shouldRemove, ModificationFunction? modificationFunction) returns FHIRPathInterpreterError|map<json> {
    json[] innerResults = check evaluate(expr, context, {});

    if innerResults.length() == 0 {
        if shouldRemove { return context; }
        return error FHIRPathInterpreterError("Path does not exist in the resource",
            token = {tokenType: EOF, lexeme: "", literal: (), position: 0});
    }

    foreach json innerItem in innerResults {
        if innerItem is json[] {
            json[] arr = <json[]>innerItem;

            if shouldRemove {
                if outerIndex >= 0 && outerIndex < arr.length() {
                    json[] newArr = [];
                    foreach int i in 0 ..< arr.length() {
                        if i != outerIndex { newArr.push(arr[i]); }
                    }
                    while arr.length() > 0 {
                        _ = arr.pop();
                    }
                    foreach json item in newArr {
                        arr.push(item);
                    }
                }
                continue;
            }

            if outerIndex < 0 || outerIndex >= arr.length() {
                return error FHIRPathInterpreterError(string `Index ${outerIndex} is out of bounds for array with length ${arr.length()}`,
                    token = {tokenType: EOF, lexeme: "", literal: (), position: 0});
            }

            json|error modifiedValue = getModifiedValueInternal(arr[outerIndex], modificationFunction, newValue);
            if modifiedValue is error {
                return error FHIRPathInterpreterError(modifiedValue.message(),
                    token = {tokenType: EOF, lexeme: "", literal: (), position: 0});
            }
            arr[outerIndex] = modifiedValue;
        }
    }

    return context;
}

# Function to modify the value at the path
public type ModificationFunction isolated function (json param) returns json|error;

isolated function getModifiedValueInternal(json currentValue, ModificationFunction? modificationFunction, json? newValue) returns json|error {
    if currentValue !is () && modificationFunction !is () {
        return modificationFunction(currentValue);
    }
    if newValue !is () {
        return newValue;
    }
    return currentValue;
}

// Shared helper — used by both interpreter and function files
isolated function applyIndex(json item, int index) returns FHIRPathInterpreterError|json[] {
    if item is () { return []; }
    if item !is json[] { return []; }
    json[] arr = <json[]>item;
    if index < 0 || index >= arr.length() { return []; }
    return wrapInCollection(arr[index]);
}
