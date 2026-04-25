import ballerina/test;

// Group: testInheritance — 

@test:Config {}
function test_testFHIRPathIsFunction1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.is(code)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction1");
}

@test:Config {}
function test_testFHIRPathIsFunction2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.is(string)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction2");
}

@test:Config {}
function test_testFHIRPathIsFunction3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.is(id)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction3");
}

@test:Config {}
function test_testFHIRPathIsFunction4() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.url.is(uri)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction4");
}

@test:Config {}
function test_testFHIRPathIsFunction5() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.url.is(url)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction5");
}

@test:Config {}
function test_testFHIRPathIsFunction6() returns error? {
    json 'resource = testSuiteValuesetExampleExpansion;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "ValueSet.version.is(string)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction6");
}

@test:Config {}
function test_testFHIRPathIsFunction7() returns error? {
    json 'resource = testSuiteValuesetExampleExpansion;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "ValueSet.version.is(code)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction7");
}

@test:Config {}
function test_testFHIRPathIsFunction8() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.extension('http://example.com/fhir/StructureDefinition/patient-age').value is Age", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction8");
}

@test:Config {}
function test_testFHIRPathIsFunction9() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.extension('http://example.com/fhir/StructureDefinition/patient-age').value is Quantity", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction9");
}

@test:Config {}
function test_testFHIRPathIsFunction10() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.extension('http://example.com/fhir/StructureDefinition/patient-age').value is Duration", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testFHIRPathIsFunction10");
}

@test:Config {}
function test_testFHIRPathAsFunction11() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.as(string)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testFHIRPathAsFunction11: expected empty result");
}

@test:Config {}
function test_testFHIRPathAsFunction12() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.as(code)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["male"];
    test:assertEquals(result, expected, msg = "test_testFHIRPathAsFunction12");
}

@test:Config {}
function test_testFHIRPathAsFunction13() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.as(id)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testFHIRPathAsFunction13: expected empty result");
}

@test:Config {}
function test_testFHIRPathAsFunction14() returns error? {
    json 'resource = testSuiteValuesetExampleExpansion;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "ValueSet.version.as(string)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["20150622"];
    test:assertEquals(result, expected, msg = "test_testFHIRPathAsFunction14");
}

@test:Config {}
function test_testFHIRPathAsFunction15() returns error? {
    json 'resource = testSuiteValuesetExampleExpansion;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "ValueSet.version.as(code)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testFHIRPathAsFunction15: expected empty result");
}

@test:Config {}
function test_testFHIRPathAsFunction16() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.ofType(string)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testFHIRPathAsFunction16: expected empty result");
}

@test:Config {}
function test_testFHIRPathAsFunction17() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.ofType(code)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["male"];
    test:assertEquals(result, expected, msg = "test_testFHIRPathAsFunction17");
}

@test:Config {}
function test_testFHIRPathAsFunction18() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.ofType(id)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testFHIRPathAsFunction18: expected empty result");
}

@test:Config {}
function test_testFHIRPathAsFunction19() returns error? {
    json 'resource = testSuiteValuesetExampleExpansion;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "ValueSet.version.ofType(string)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["20150622"];
    test:assertEquals(result, expected, msg = "test_testFHIRPathAsFunction19");
}

@test:Config {}
function test_testFHIRPathAsFunction20() returns error? {
    json 'resource = testSuiteValuesetExampleExpansion;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "ValueSet.version.ofType(code)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testFHIRPathAsFunction20: expected empty result");
}

@test:Config {}
function test_testFHIRPathAsFunction21() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.as(HumanName).use", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testFHIRPathAsFunction21: expected execution error");
}

@test:Config {}
function test_testFHIRPathAsFunction22() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.ofType(HumanName).use", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["official", "usual", "maiden"];
    test:assertEquals(result, expected, msg = "test_testFHIRPathAsFunction22");
}

@test:Config {}
function test_testFHIRPathAsFunction23() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.as(string1)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testFHIRPathAsFunction23: expected execution error");
}

@test:Config {}
function test_testFHIRPathAsFunction24() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.gender.ofType(string1)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testFHIRPathAsFunction24: expected execution error");
}
