import ballerina/test;

// Group: testMiscellaneousAccessorTests — Miscellaneous accessor tests

@test:Config {}
function test_testExtractBirthDate() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "birthDate", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-12-25"];
    test:assertEquals(result, expected, msg = "test_testExtractBirthDate");
}

@test:Config {}
function test_testPatientHasBirthDate() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "birthDate", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPatientHasBirthDate");
}

@test:Config {}
function test_testPatientTelecomTypes() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "telecom.use", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["home", "work", "mobile", "old"];
    test:assertEquals(result, expected, msg = "test_testPatientTelecomTypes");
}
