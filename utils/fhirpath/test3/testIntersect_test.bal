import ballerina/test;

// Group: testIntersect — 

@test:Config {}
function test_testIntersect1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(1 | 2 | 3).intersect(2 | 4) = 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntersect1");
}

@test:Config {}
function test_testIntersect2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(1 | 2).intersect(4).empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntersect2");
}

@test:Config {}
function test_testIntersect3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(1 | 2).intersect({}).empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntersect3");
}

@test:Config {}
function test_testIntersect4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.combine(1).intersect(1).count() = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntersect4");
}
