import ballerina/test;

// Group: testRepeat — 

@test:Config {}
function test_testRepeat1() returns error? {
    json 'resource = testSuiteValuesetExampleExpansion;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "ValueSet.expansion.repeat(contains).count() = 10", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testRepeat1");
}

@test:Config {}
function test_testRepeat2() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.repeat(item).code.count() = 11", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testRepeat2");
}

@test:Config {}
function test_testRepeat3() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.descendants().code.count() = 23", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testRepeat3");
}

@test:Config {}
function test_testRepeat4() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.children().code.count() = 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testRepeat4");
}

@test:Config {}
function test_testRepeat5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.repeat('test')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["test"];
    test:assertEquals(result, expected, msg = "test_testRepeat5");
}
