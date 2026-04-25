import ballerina/test;

// Group: testExtension — 

@test:Config {}
function test_testExtension1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate.extension('http://hl7.org/fhir/StructureDefinition/patient-birthTime').exists()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testExtension1");
}

@test:Config {}
function test_testExtension2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate.extension(%`ext-patient-birthTime`).exists()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testExtension2");
}

@test:Config {}
function test_testExtension3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate.extension('http://hl7.org/fhir/StructureDefinition/patient-birthTime1').empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testExtension3");
}
