import ballerina/test;

// Group: polymorphics — 

@test:Config {}
function test_testPolymorphicsA() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.exists()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPolymorphicsA");
}

@test:Config {}
function test_testPolymorphicsB() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.valueQuantity.exists()", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPolymorphicsB: expected semantic error");
}

@test:Config {}
function test_testPolymorphicsC() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.valueQuantity.exists()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPolymorphicsC");
}

@test:Config {}
function test_testPolymorphicsD() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.valueString.exists()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testPolymorphicsD");
}
