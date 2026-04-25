import ballerina/test;

// Group: testPlus — 

@test:Config {}
function test_testPlus1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 + 1 = 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPlus1");
}

@test:Config {}
function test_testPlus2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 + 0 = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPlus2");
}

@test:Config {}
function test_testPlus3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.2 + 1.8 = 3.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPlus3");
}

@test:Config {}
function test_testPlus4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a'+'b' = 'ab'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPlus4");
}

@test:Config {}
function test_testPlus5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a'+{}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testPlus5: expected empty result");
}

@test:Config {}
function test_testPlusDate1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 7 days", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-01-01"];
    test:assertEquals(result, expected, msg = "test_testPlusDate1");
}

@test:Config {}
function test_testPlusDate2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 7.7 days", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-01-01"];
    test:assertEquals(result, expected, msg = "test_testPlusDate2");
}

@test:Config {}
function test_testPlusDate3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 7 days", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-01-01T00:00:00.000+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate3");
}

@test:Config {}
function test_testPlusDate4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 7.7 days", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-01-01T00:00:00.000+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate4");
}

@test:Config {}
function test_testPlusDate5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 1 second", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T00:00:01.000+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate5");
}

@test:Config {}
function test_testPlusDate6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 10 millisecond", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T00:00:00.010+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate6");
}

@test:Config {}
function test_testPlusDate7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 1 minute", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T00:01:00.000+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate7");
}

@test:Config {}
function test_testPlusDate8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 1 hour", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T01:00:00.000+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate8");
}

@test:Config {}
function test_testPlusDate9() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 1 day", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-26"];
    test:assertEquals(result, expected, msg = "test_testPlusDate9");
}

@test:Config {}
function test_testPlusDate10() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 1 month", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-01-25"];
    test:assertEquals(result, expected, msg = "test_testPlusDate10");
}

@test:Config {}
function test_testPlusDate11() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 1 week", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-01-01"];
    test:assertEquals(result, expected, msg = "test_testPlusDate11");
}

@test:Config {}
function test_testPlusDate12() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 1 year", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-12-25"];
    test:assertEquals(result, expected, msg = "test_testPlusDate12");
}

@test:Config {}
function test_testPlusDate13() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 1 'd'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-26"];
    test:assertEquals(result, expected, msg = "test_testPlusDate13");
}

@test:Config {}
function test_testPlusDate14() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 1 'mo'", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPlusDate14: expected execution error");
}

@test:Config {}
function test_testPlusDate15() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 1 'wk'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1974-01-01"];
    test:assertEquals(result, expected, msg = "test_testPlusDate15");
}

@test:Config {}
function test_testPlusDate16() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25 + 1 'a'", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPlusDate16: expected execution error");
}

@test:Config {}
function test_testPlusDate17() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1975-12-25 + 1 'a'", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPlusDate17: expected execution error");
}

@test:Config {}
function test_testPlusDate18() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 1 's'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T00:00:01.000+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate18");
}

@test:Config {}
function test_testPlusDate19() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 0.1 's'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T00:00:00.100+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate19");
}

@test:Config {}
function test_testPlusDate20() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 10 'ms'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T00:00:00.010+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate20");
}

@test:Config {}
function test_testPlusDate21() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 1 'min'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T00:01:00.000+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate21");
}

@test:Config {}
function test_testPlusDate22() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1973-12-25T00:00:00.000+10:00 + 1 'h'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@1973-12-25T01:00:00.000+10:00"];
    test:assertEquals(result, expected, msg = "test_testPlusDate22");
}

@test:Config {}
function test_testPlus6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@1974-12-25 + 7", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testPlus6: expected semantic error");
}

@test:Config {}
function test_testPlusTime1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T01:00:00 + 2 hours", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@T03:00:00"];
    test:assertEquals(result, expected, msg = "test_testPlusTime1");
}

@test:Config {}
function test_testPlusTime2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T23:00:00 + 2 hours", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@T01:00:00"];
    test:assertEquals(result, expected, msg = "test_testPlusTime2");
}

@test:Config {}
function test_testPlusTime3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T23:00:00 + 50 hours", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@T01:00:00"];
    test:assertEquals(result, expected, msg = "test_testPlusTime3");
}

@test:Config {}
function test_testPlusEmpty1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 + {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testPlusEmpty1: expected empty result");
}

@test:Config {}
function test_testPlusEmpty2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} + 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testPlusEmpty2: expected empty result");
}

@test:Config {}
function test_testPlusEmpty3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} + {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testPlusEmpty3: expected empty result");
}
