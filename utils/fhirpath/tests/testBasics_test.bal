import ballerina/test;

// Group: testBasics — Tests ported from the Java Unit Tests

@test:Config {}
function test_testSimple() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "name.given", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James", "Jim", "Peter", "James"];
    test:assertEquals(result, expected, msg = "test_testSimple");
}

@test:Config {}
function test_testSimpleNone() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "name.suffix", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testSimpleNone: expected empty result");
}

@test:Config {}
function test_testEscapedIdentifier() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "name.`given`", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James", "Jim", "Peter", "James"];
    test:assertEquals(result, expected, msg = "test_testEscapedIdentifier");
}

@test:Config {}
function test_testSimpleBackTick1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "`Patient`.name.`given`", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James", "Jim", "Peter", "James"];
    test:assertEquals(result, expected, msg = "test_testSimpleBackTick1");
}

@test:Config {}
function test_testSimpleFail() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "name.given1", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testSimpleFail: expected semantic error");
}

@test:Config {}
function test_testSimpleWithContext() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James", "Jim", "Peter", "James"];
    test:assertEquals(result, expected, msg = "test_testSimpleWithContext");
}

@test:Config {}
function test_testSimpleWithWrongContext() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Encounter.name.given", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testSimpleWithWrongContext: expected semantic error");
}
