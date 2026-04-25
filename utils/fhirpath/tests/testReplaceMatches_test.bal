import ballerina/test;

// Group: testReplaceMatches — 

@test:Config {}
function test_testReplaceMatches1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'123456'.replaceMatches('234', 'X')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1X56"];
    test:assertEquals(result, expected, msg = "test_testReplaceMatches1");
}

@test:Config {}
function test_testReplaceMatches2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'abc'.replaceMatches('', 'x')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["abc"];
    test:assertEquals(result, expected, msg = "test_testReplaceMatches2");
}

@test:Config {}
function test_testReplaceMatches3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'123456'.replaceMatches('234', '')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["156"];
    test:assertEquals(result, expected, msg = "test_testReplaceMatches3");
}

@test:Config {}
function test_testReplaceMatches4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.replaceMatches('234', 'X').empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testReplaceMatches4");
}

@test:Config {}
function test_testReplaceMatches5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'123'.replaceMatches({}, 'X').empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testReplaceMatches5");
}

@test:Config {}
function test_testReplaceMatches6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'123'.replaceMatches('2', {}).empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testReplaceMatches6");
}

@test:Config {}
function test_testReplaceMatches7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'abc123'.replaceMatches('[0-9]', '-')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["abc---"];
    test:assertEquals(result, expected, msg = "test_testReplaceMatches7");
}
