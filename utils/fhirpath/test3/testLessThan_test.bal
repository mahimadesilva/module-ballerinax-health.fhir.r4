import ballerina/test;

// Group: testLessThan — 

@test:Config {}
function test_testLessThan1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 < 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessThan1");
}

@test:Config {}
function test_testLessThan2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0 < 1.2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessThan2");
}

@test:Config {}
function test_testLessThan3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a' < 'b'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessThan3");
}

@test:Config {}
function test_testLessThan4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'A' < 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessThan4");
}

@test:Config {}
function test_testLessThan5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-12 < @2014-12-13", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessThan5");
}

@test:Config {}
function test_testLessThan6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:00 < @2014-12-13T12:00:01", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessThan6");
}

@test:Config {}
function test_testLessThan7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:00 < @T14:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessThan7");
}

@test:Config {}
function test_testLessThan8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 < 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan8");
}

@test:Config {}
function test_testLessThan9() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0 < 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan9");
}

@test:Config {}
function test_testLessThan10() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a' < 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan10");
}

@test:Config {}
function test_testLessThan11() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'A' < 'A'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan11");
}

@test:Config {}
function test_testLessThan12() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-12 < @2014-12-12", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan12");
}

@test:Config {}
function test_testLessThan13() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:00 < @2014-12-13T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan13");
}

@test:Config {}
function test_testLessThan14() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:00 < @T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan14");
}

@test:Config {}
function test_testLessThan15() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2 < 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan15");
}

@test:Config {}
function test_testLessThan16() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.1 < 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan16");
}

@test:Config {}
function test_testLessThan17() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'b' < 'a'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan17");
}

@test:Config {}
function test_testLessThan18() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'B' < 'A'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan18");
}

@test:Config {}
function test_testLessThan19() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13 < @2014-12-12", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan19");
}

@test:Config {}
function test_testLessThan20() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-12-13T12:00:01 < @2014-12-13T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan20");
}

@test:Config {}
function test_testLessThan21() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T12:00:01 < @T12:00:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan21");
}

@test:Config {}
function test_testLessThan22() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value < 200 '[lb_av]'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLessThan22");
}

@test:Config {}
function test_testLessThan23() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03 < @2018-03-01", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessThan23: expected empty result");
}

@test:Config {}
function test_testLessThan24() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03-01T10:30 < @2018-03-01T10:30:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessThan24: expected empty result");
}

@test:Config {}
function test_testLessThan25() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30 < @T10:30:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessThan25: expected empty result");
}

@test:Config {}
function test_testLessThan26() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2018-03-01T10:30:00 < @2018-03-01T10:30:00.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan26");
}

@test:Config {}
function test_testLessThan27() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30:00 < @T10:30:00.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLessThan27");
}

@test:Config {}
function test_testLessThanEmpty1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 < {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessThanEmpty1: expected empty result");
}

@test:Config {}
function test_testLessThanEmpty2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} < 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessThanEmpty2: expected empty result");
}

@test:Config {}
function test_testLessThanEmpty3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{} < {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testLessThanEmpty3: expected empty result");
}
