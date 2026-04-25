import ballerina/test;

// Group: comments — Check various comment syntaxes

@test:Config {}
function test_testComment1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 + 2 // This is a single-line comment + 4", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [4];
    test:assertEquals(result, expected, msg = "test_testComment1");
}

@test:Config {}
function test_testComment2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "// This is a multi line comment using // that // should not fail during parsing 2+2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [4];
    test:assertEquals(result, expected, msg = "test_testComment2");
}

@test:Config {}
function test_testComment3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 + 2 /* This is a multi-line comment Any text enclosed within is ignored +2 */", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [4];
    test:assertEquals(result, expected, msg = "test_testComment3");
}

@test:Config {}
function test_testComment4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 + 2 /* This is a multi-line comment Any text enclosed within is ignored */ +2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [6];
    test:assertEquals(result, expected, msg = "test_testComment4");
}

@test:Config {}
function test_testComment5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "/* This is a multi-line comment Any text enclosed within is ignored */ 2+2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [4];
    test:assertEquals(result, expected, msg = "test_testComment5");
}

@test:Config {}
function test_testComment6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 // comment / 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1];
    test:assertEquals(result, expected, msg = "test_testComment6");
}

@test:Config {}
function test_testComment7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 + 2 /", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testComment7: expected syntax error");
}

@test:Config {}
function test_testComment8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 + 2 /* not finished", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testComment8: expected syntax error");
}

@test:Config {}
function test_testComment9() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 + /* inline $@%^+ * */ 2 = 4", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testComment9");
}
