import ballerina/test;

// Group: testEndsWith — 

@test:Config {}
function test_testEndsWith1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'12345'.endsWith('2') = false", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith1");
}

@test:Config {}
function test_testEndsWith2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'12345'.endsWith('5') = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith2");
}

@test:Config {}
function test_testEndsWith3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'12345'.endsWith('45') = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith3");
}

@test:Config {}
function test_testEndsWith4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'12345'.endsWith('35') = false", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith4");
}

@test:Config {}
function test_testEndsWith5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'12345'.endsWith('12345') = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith5");
}

@test:Config {}
function test_testEndsWith6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'12345'.endsWith('012345') = false", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith6");
}

@test:Config {}
function test_testEndsWith7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'12345'.endsWith('') = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith7");
}

@test:Config {}
function test_testEndsWith8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.endsWith('1').empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith8");
}

@test:Config {}
function test_testEndsWith9() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.endsWith('').empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith9");
}

@test:Config {}
function test_testEndsWith10() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'123456789'.select(endsWith(length().toString()))", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEndsWith10");
}

@test:Config {}
function test_testEndsWith10a() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'123456789'.endsWith(length().toString())", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testEndsWith10a: expected semantic error");
}

@test:Config {}
function test_testEndsWithNonString1() returns error? {
    json 'resource = testSuiteAppointmentExamplereq;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Appointment.identifier.endsWith('rand')", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testEndsWithNonString1: expected semantic error");
}
