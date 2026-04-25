import ballerina/test;

// Group: testJoin — 

@test:Config {}
function test_testJoin() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "name.given.join(',')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter,James,Jim,Peter,James"];
    test:assertEquals(result, expected, msg = "test_testJoin");
}
