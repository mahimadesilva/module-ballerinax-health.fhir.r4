import ballerina/test;

// Group: testCombine() — 

@test:Config {}
function test_testCombine1() returns error? {
    json 'resource = testSuiteCodesystemExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "concept.code.combine($this.descendants().concept.code).isDistinct()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testCombine1");
}

@test:Config {}
function test_testCombine2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "name.given.combine(name.family).exclude('Jim')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James", "Peter", "James", "Chalmers", "Windsor"];
    test:assertEquals(result, expected, msg = "test_testCombine2");
}

@test:Config {}
function test_testCombine3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "name.given.combine($this.name.family).exclude('Jim')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James", "Peter", "James", "Chalmers", "Windsor"];
    test:assertEquals(result, expected, msg = "test_testCombine3");
}
