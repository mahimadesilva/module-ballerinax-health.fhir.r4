import ballerina/test;

// Group: testIif — 

@test:Config {}
function test_testIif1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(Patient.name.exists(), 'named', 'unnamed') = 'named'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIif1");
}

@test:Config {}
function test_testIif2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(Patient.name.empty(), 'unnamed', 'named') = 'named'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIif2");
}

@test:Config {}
function test_testIif3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(true, true, (1 | 2).toString())", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIif3");
}

@test:Config {}
function test_testIif4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(false, (1 | 2).toString(), true)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIif4");
}

@test:Config {}
function test_testIif5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif(false, 'true-result').empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIif5");
}

@test:Config {}
function test_testIif6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "iif('non boolean criteria', 'true-result', 'false-result')", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testIif6: expected semantic error");
}

@test:Config {}
function test_testIif7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.iif(true, 'true-result', 'false-result')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["true-result"];
    test:assertEquals(result, expected, msg = "test_testIif7");
}

@test:Config {}
function test_testIif8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "('item').iif(true, 'true-result', 'false-result')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["true-result"];
    test:assertEquals(result, expected, msg = "test_testIif8");
}

@test:Config {}
function test_testIif9() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "('context').iif(true, select($this), 'false-result')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["context"];
    test:assertEquals(result, expected, msg = "test_testIif9");
}

@test:Config {}
function test_testIif10() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "('item1' | 'item2').iif(true, 'true-result', 'false-result')", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testIif10: expected execution error");
}

@test:Config {}
function test_testIif11() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "('context').iif($this = 'context','true-result', 'false-result')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["true-result"];
    test:assertEquals(result, expected, msg = "test_testIif11");
}

@test:Config {}
function test_testIif12() returns error? {
    json 'resource = testSuitePatientExampleName;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.first().iif(text.exists(), text, family+given.first())", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Pater J Chalmers"];
    test:assertEquals(result, expected, msg = "test_testIif12");
}
