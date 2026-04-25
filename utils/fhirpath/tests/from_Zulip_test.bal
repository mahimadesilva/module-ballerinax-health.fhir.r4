import ballerina/test;

// Group: from-Zulip — 

@test:Config {}
function test_from_zulip_1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(true and 'foo').empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_from_zulip_1");
}

@test:Config {}
function test_from_zulip_2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(true | 'foo').allTrue()", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_from_zulip_2: expected execution error");
}
