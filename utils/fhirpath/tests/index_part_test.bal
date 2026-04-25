import ballerina/test;

// Group: index-part — 

@test:Config {}
function test_testIndex() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.telecom.select(iif(value='(03) 3410 5613', $index, {} ))", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [2];
    test:assertEquals(result, expected, msg = "test_testIndex");
}
