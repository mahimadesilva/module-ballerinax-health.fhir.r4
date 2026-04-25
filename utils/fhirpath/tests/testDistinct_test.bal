import ballerina/test;

// Group: testDistinct — 

@test:Config {}
function test_testDistinct1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(1 | 2 | 3).isDistinct()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDistinct1");
}

@test:Config {}
function test_testDistinct2() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.descendants().linkId.isDistinct()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDistinct2");
}

@test:Config {}
function test_testDistinct3() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.descendants().linkId.select(substring(0,1)).isDistinct().not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDistinct3");
}

@test:Config {}
function test_testDistinct4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(1 | 2 | 3).distinct()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1, 2, 3];
    test:assertEquals(result, expected, msg = "test_testDistinct4");
}

@test:Config {}
function test_testDistinct5() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.descendants().linkId.distinct().count()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [10];
    test:assertEquals(result, expected, msg = "test_testDistinct5");
}

@test:Config {}
function test_testDistinct6() returns error? {
    json 'resource = testSuiteQuestionnaireExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Questionnaire.descendants().linkId.select(substring(0,1)).distinct().count()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [2];
    test:assertEquals(result, expected, msg = "test_testDistinct6");
}
