import ballerina/test;

// Group: testLessOrEqual — 

@test:Config {}
function test_testLessOrEqual1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 <= 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual1");
}

@test:Config {}
function test_testLessOrEqual2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0 <= 1.2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual2");
}

@test:Config {}
function test_testLessOrEqual3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a' <= 'b'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual3");
}

@test:Config {}
function test_testLessOrEqual4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'A' <= 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual4");
}

@test:Config {}
function test_testLessOrEqual5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-12 <= @2014-12-13", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual5");
}

@test:Config {}
function test_testLessOrEqual6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:00 <= @2014-12-13T12:00:01", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual6");
}

@test:Config {}
function test_testLessOrEqual7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:00 <= @T14:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual7");
}

@test:Config {}
function test_testLessOrEqual8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 <= 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual8");
}

@test:Config {}
function test_testLessOrEqual9() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0 <= 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual9");
}

@test:Config {}
function test_testLessOrEqual10() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a' <= 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual10");
}

@test:Config {}
function test_testLessOrEqual11() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'A' <= 'A'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual11");
}

@test:Config {}
function test_testLessOrEqual12() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-12 <= @2014-12-12", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual12");
}

@test:Config {}
function test_testLessOrEqual13() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:00 <= @2014-12-13T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual13");
}

@test:Config {}
function test_testLessOrEqual14() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:00 <= @T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual14");
}

@test:Config {}
function test_testLessOrEqual15() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 <= 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual15");
}

@test:Config {}
function test_testLessOrEqual16() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.1 <= 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual16");
}

@test:Config {}
function test_testLessOrEqual17() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'b' <= 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual17");
}

@test:Config {}
function test_testLessOrEqual18() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'B' <= 'A'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual18");
}

@test:Config {}
function test_testLessOrEqual19() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13 <= @2014-12-12", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual19");
}

@test:Config {}
function test_testLessOrEqual20() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:01 <= @2014-12-13T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual20");
}

@test:Config {}
function test_testLessOrEqual21() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:01 <= @T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual21");
}

@test:Config {}
function test_testLessOrEqual22() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value <= 200 '[lb_av]'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual22");
}

@test:Config {}
function test_testLessOrEqual23() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03 <= @2018-03-01", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessOrEqual23: expected empty result");
}

@test:Config {}
function test_testLessOrEqual24() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03-01T10:30 <= @2018-03-01T10:30:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessOrEqual24: expected empty result");
}

@test:Config {}
function test_testLessOrEqual25() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30 <= @T10:30:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessOrEqual25: expected empty result");
}

@test:Config {}
function test_testLessOrEqual26() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03-01T10:30:00 <= @2018-03-01T10:30:00.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual26");
}

@test:Config {}
function test_testLessOrEqual27() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30:00 <= @T10:30:00.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessOrEqual27");
}

@test:Config {}
function test_testLessOrEqualEmpty1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 <= {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessOrEqualEmpty1: expected empty result");
}

@test:Config {}
function test_testLessOrEqualEmpty2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} <= 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessOrEqualEmpty2: expected empty result");
}

@test:Config {}
function test_testLessOrEqualEmpty3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} <= {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessOrEqualEmpty3: expected empty result");
}
