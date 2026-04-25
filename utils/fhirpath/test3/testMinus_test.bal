import ballerina/test;

// Group: testMinus — 

@test:Config {}
function test_testMinus1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 - 1 = 0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMinus1");
}

@test:Config {}
function test_testMinus2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 - 0 = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMinus2");
}

@test:Config {}
function test_testMinus3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.8 - 1.2 = 0.6", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMinus3");
}

@test:Config {}
function test_testMinus4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a'-'b' = 'ab'", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testMinus4: expected execution error");
}

@test:Config {}
function test_testMinus5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1974-12-25 - 1 'month'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-11-25"];
    test:assertEquals(result, expected, msg = "test_testMinus5");
}

@test:Config {}
function test_testMinus6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1974-12-25 - 1 'cm'", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testMinus6: expected execution error");
}

@test:Config {}
function test_testMinus7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T00:30:00 - 1 hour", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@T23:30:00"];
    test:assertEquals(result, expected, msg = "test_testMinus7");
}

@test:Config {}
function test_testMinus8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T01:00:00 - 2 hours", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@T23:00:00"];
    test:assertEquals(result, expected, msg = "test_testMinus8");
}

@test:Config {}
function test_testMinusEmpty1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 - {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testMinusEmpty1: expected empty result");
}

@test:Config {}
function test_testMinusEmpty2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} - 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testMinusEmpty2: expected empty result");
}

@test:Config {}
function test_testMinusEmpty3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} - {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testMinusEmpty3: expected empty result");
}
