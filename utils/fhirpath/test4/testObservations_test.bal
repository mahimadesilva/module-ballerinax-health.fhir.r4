import ballerina/test;

// Group: testObservations — 

@test:Config {}
function test_testPolymorphismA() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.unit", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["lbs"];
    test:assertEquals(result, expected, msg = "test_testPolymorphismA");
}

@test:Config {}
function test_testPolymorphismB() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.valueQuantity.unit", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPolymorphismB: expected semantic error");
}

@test:Config {}
function test_testPolymorphismIsA1() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.is(Quantity)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPolymorphismIsA1");
}

@test:Config {}
function test_testPolymorphismIsA2() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value is Quantity", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPolymorphismIsA2");
}

@test:Config {}
function test_testPolymorphismIsA3() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.issued is instant", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testPolymorphismIsA3: expected empty result");
}

@test:Config {}
function test_testPolymorphismIsB() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.is(Period).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPolymorphismIsB");
}

@test:Config {}
function test_testPolymorphismAsA() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.as(Quantity).unit", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["lbs"];
    test:assertEquals(result, expected, msg = "test_testPolymorphismAsA");
}

@test:Config {}
function test_testPolymorphismAsAFunction() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(Observation.value as Quantity).unit", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["lbs"];
    test:assertEquals(result, expected, msg = "test_testPolymorphismAsAFunction");
}

@test:Config {}
function test_testPolymorphismAsB() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(Observation.value as Period).unit", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPolymorphismAsB: expected semantic error");
}

@test:Config {}
function test_testPolymorphismAsBFunction() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.as(Period).start", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testPolymorphismAsBFunction: expected empty result");
}
