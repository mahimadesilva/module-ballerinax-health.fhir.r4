import ballerina/test;

// Group: testCollectionBoolean — 

@test:Config {}
function test_testCollectionBoolean1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(1 | 2 | 3, true, false)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testCollectionBoolean1: expected semantic error");
}

@test:Config {}
function test_testCollectionBoolean2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif({}, true, false)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testCollectionBoolean2");
}

@test:Config {}
function test_testCollectionBoolean3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(true, true, false)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testCollectionBoolean3");
}

@test:Config {}
function test_testCollectionBoolean4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif({} | true, true, false)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testCollectionBoolean4");
}

@test:Config {}
function test_testCollectionBoolean5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(true, true, 1/0)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testCollectionBoolean5");
}

@test:Config {}
function test_testCollectionBoolean6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(false, 1/0, true)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testCollectionBoolean6");
}
