import ballerina/test;

// Group: testConformsTo — 

@test:Config {}
function test_testConformsTo1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "conformsTo('http://hl7.org/fhir/StructureDefinition/Patient')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testConformsTo1");
}

@test:Config {}
function test_testConformsTo2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "conformsTo('http://hl7.org/fhir/StructureDefinition/Person')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testConformsTo2");
}

@test:Config {}
function test_testConformsTo3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "conformsTo('http://trash')", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testConformsTo3: expected execution error");
}
