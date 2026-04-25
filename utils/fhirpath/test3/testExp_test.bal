import ballerina/test;

// Group: testExp — 

@test:Config {}
function test_testExp1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.exp() = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testExp1");
}

@test:Config {}
function test_testExp2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-0.0).exp() = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testExp2");
}

@test:Config {}
function test_testExp3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.exp().empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testExp3");
}
