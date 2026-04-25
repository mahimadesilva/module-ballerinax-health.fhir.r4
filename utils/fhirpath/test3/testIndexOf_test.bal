import ballerina/test;

// Group: testIndexOf — 

@test:Config {}
function test_testIndexOf1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'LogicalModel-Person'.indexOf('-')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [12];
    test:assertEquals(result, expected, msg = "test_testIndexOf1");
}

@test:Config {}
function test_testIndexOf2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'LogicalModel-Person'.indexOf('z')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-1];
    test:assertEquals(result, expected, msg = "test_testIndexOf2");
}

@test:Config {}
function test_testIndexOf3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'LogicalModel-Person'.indexOf('')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [0];
    test:assertEquals(result, expected, msg = "test_testIndexOf3");
}

@test:Config {}
function test_testIndexOf5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'LogicalModel-Person'.indexOf({}).empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIndexOf5");
}

@test:Config {}
function test_testIndexOf4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.indexOf('-').empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIndexOf4");
}

@test:Config {}
function test_testIndexOf6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.indexOf({}).empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIndexOf6");
}
