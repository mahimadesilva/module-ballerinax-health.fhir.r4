import ballerina/test;

// Group: Precision — 

@test:Config {}
function test_PrecisionDecimal() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.58700.precision()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [5];
    test:assertEquals(result, expected, msg = "test_PrecisionDecimal");
}

@test:Config {}
function test_PrecisionYear() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014.precision()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [4];
    test:assertEquals(result, expected, msg = "test_PrecisionYear");
}

@test:Config {}
function test_PrecisionDateTimeMilliseconds() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-01-05T10:30:00.000.precision()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [17];
    test:assertEquals(result, expected, msg = "test_PrecisionDateTimeMilliseconds");
}

@test:Config {}
function test_PrecisionTimeMinutes() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30.precision()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [4];
    test:assertEquals(result, expected, msg = "test_PrecisionTimeMinutes");
}

@test:Config {}
function test_PrecisionTimeMilliseconds() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30:00.000.precision()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [9];
    test:assertEquals(result, expected, msg = "test_PrecisionTimeMilliseconds");
}

@test:Config {}
function test_PrecisionEmpty() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.precision().empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_PrecisionEmpty");
}
