import ballerina/test;

// Group: testGreatorOrEqual — 

@test:Config {}
function test_testGreatorOrEqual1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 >= 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual1");
}

@test:Config {}
function test_testGreatorOrEqual2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0 >= 1.2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual2");
}

@test:Config {}
function test_testGreatorOrEqual3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a' >= 'b'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual3");
}

@test:Config {}
function test_testGreatorOrEqual4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'A' >= 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual4");
}

@test:Config {}
function test_testGreatorOrEqual5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-12 >= @2014-12-13", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual5");
}

@test:Config {}
function test_testGreatorOrEqual6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:00 >= @2014-12-13T12:00:01", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual6");
}

@test:Config {}
function test_testGreatorOrEqual7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:00 >= @T14:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual7");
}

@test:Config {}
function test_testGreatorOrEqual8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 >= 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual8");
}

@test:Config {}
function test_testGreatorOrEqual9() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0 >= 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual9");
}

@test:Config {}
function test_testGreatorOrEqual10() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a' >= 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual10");
}

@test:Config {}
function test_testGreatorOrEqual11() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'A' >= 'A'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual11");
}

@test:Config {}
function test_testGreatorOrEqual12() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-12 >= @2014-12-12", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual12");
}

@test:Config {}
function test_testGreatorOrEqual13() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:00 >= @2014-12-13T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual13");
}

@test:Config {}
function test_testGreatorOrEqual14() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:00 >= @T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual14");
}

@test:Config {}
function test_testGreatorOrEqual15() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 >= 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual15");
}

@test:Config {}
function test_testGreatorOrEqual16() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.1 >= 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual16");
}

@test:Config {}
function test_testGreatorOrEqual17() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'b' >= 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual17");
}

@test:Config {}
function test_testGreatorOrEqual18() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'B' >= 'A'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual18");
}

@test:Config {}
function test_testGreatorOrEqual19() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13 >= @2014-12-12", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual19");
}

@test:Config {}
function test_testGreatorOrEqual20() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:01 >= @2014-12-13T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual20");
}

@test:Config {}
function test_testGreatorOrEqual21() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:01 >= @T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual21");
}

@test:Config {}
function test_testGreatorOrEqual22() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value >= 100 '[lb_av]'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual22");
}

@test:Config {}
function test_testGreatorOrEqual23() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03 >= @2018-03-01", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testGreatorOrEqual23: expected empty result");
}

@test:Config {}
function test_testGreatorOrEqual24() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03-01T10:30 >= @2018-03-01T10:30:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testGreatorOrEqual24: expected empty result");
}

@test:Config {}
function test_testGreatorOrEqual25() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30 >= @T10:30:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testGreatorOrEqual25: expected empty result");
}

@test:Config {}
function test_testGreatorOrEqual26() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03-01T10:30:00 >= @2018-03-01T10:30:00.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual26");
}

@test:Config {}
function test_testGreatorOrEqual27() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30:00 >= @T10:30:00.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testGreatorOrEqual27");
}

@test:Config {}
function test_testGreatorOrEqualEmpty1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 >= {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testGreatorOrEqualEmpty1: expected empty result");
}

@test:Config {}
function test_testGreatorOrEqualEmpty2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} >= 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testGreatorOrEqualEmpty2: expected empty result");
}

@test:Config {}
function test_testGreatorOrEqualEmpty3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} >= {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testGreatorOrEqualEmpty3: expected empty result");
}
