import ballerina/test;

// Group: period — 

@test:Config {}
function test_testPeriodInvariantOld() returns error? {
    json 'resource = testSuitePatientExamplePeriod;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.identifier.period.all(start.hasValue().not() or end.hasValue().not() or (start <= end))", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testPeriodInvariantOld");
}

@test:Config {}
function test_testPeriodInvariantNew() returns error? {
    json 'resource = testSuitePatientExamplePeriod;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.identifier.period.all(start.empty() or end.empty() or (start.lowBoundary() < end.highBoundary()))", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPeriodInvariantNew");
}
