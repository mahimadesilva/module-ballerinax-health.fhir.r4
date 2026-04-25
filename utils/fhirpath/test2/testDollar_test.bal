import ballerina/test;

// Group: testDollar — 

@test:Config {}
function test_testDollarThis1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.where(substring($this.length()-3) = 'out')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testDollarThis1: expected empty result");
}

@test:Config {}
function test_testDollarThis2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.where(substring($this.length()-3) = 'ter')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "Peter"];
    test:assertEquals(result, expected, msg = "test_testDollarThis2");
}

@test:Config {}
function test_testDollarOrderAllowed() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.skip(1).given", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Jim", "Peter", "James"];
    test:assertEquals(result, expected, msg = "test_testDollarOrderAllowed");
}

@test:Config {}
function test_testDollarOrderAllowedA() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.skip(3).given", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testDollarOrderAllowedA: expected empty result");
}

@test:Config {}
function test_testDollarOrderNotAllowed() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.children().skip(1)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testDollarOrderNotAllowed: expected semantic error");
}
