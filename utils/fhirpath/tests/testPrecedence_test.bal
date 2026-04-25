import ballerina/test;

// Group: testPrecedence — 

@test:Config {}
function test_testPrecedence1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "-1.convertsToInteger()", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPrecedence1: expected execution error");
}

@test:Config {}
function test_testPrecedence2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1+2*3+4 = 11", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPrecedence2");
}

@test:Config {}
function test_testPrecedence3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 > 2 is Boolean", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPrecedence3: expected execution error");
}

@test:Config {}
function test_testPrecedence4() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(1 | 1 is Integer).count()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [2];
    test:assertEquals(result, expected, msg = "test_testPrecedence4");
}

@test:Config {}
function test_testPrecedence5() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true and '0215' in ('0215' | '0216')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPrecedence5");
}

@test:Config {}
function test_testPrecedence6() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "category.exists(coding.exists(system = 'http://terminology.hl7.org/CodeSystem/observation-category' and code.trace('c') in ('vital-signs' | 'vital-signs2').trace('codes')))", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPrecedence6");
}
