import ballerina/test;

// Group: testSingle — 

@test:Config {}
function test_testSingle1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.first().single().exists()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testSingle1");
}

@test:Config {}
function test_testSingle2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.single().exists()", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testSingle2: expected execution error");
}
