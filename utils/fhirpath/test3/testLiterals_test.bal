import ballerina/test;

// Group: testLiterals — 

@test:Config {}
function test_testLiteralTrue() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.exists() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralTrue");
}

@test:Config {}
function test_testLiteralFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.empty() = false", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralFalse");
}

@test:Config {}
function test_testLiteralString1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.first() = 'Peter'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralString1");
}

@test:Config {}
function test_testLiteralInteger1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.convertsToInteger()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralInteger1");
}

@test:Config {}
function test_testLiteralInteger0() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.convertsToInteger()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralInteger0");
}

@test:Config {}
function test_testLiteralIntegerNegative1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1).convertsToInteger()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerNegative1");
}

@test:Config {}
function test_testLiteralIntegerNegative1Invalid() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "-1.convertsToInteger()", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testLiteralIntegerNegative1Invalid: expected execution error");
}

@test:Config {}
function test_testLiteralIntegerMax() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2147483647.convertsToInteger()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerMax");
}

@test:Config {}
function test_testLiteralString2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'test'.convertsToString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralString2");
}

@test:Config {}
function test_testLiteralStringEscapes() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'\\\\\\/\\f\\r\\n\\t\\\"\\`\\'\\u002a'.convertsToString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralStringEscapes");
}

@test:Config {}
function test_testLiteralBooleanTrue() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralBooleanTrue");
}

@test:Config {}
function test_testLiteralBooleanFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "false.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralBooleanFalse");
}

@test:Config {}
function test_testLiteralDecimal10() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimal10");
}

@test:Config {}
function test_testLiteralDecimal01() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.1.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimal01");
}

@test:Config {}
function test_testLiteralDecimal00() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.0.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimal00");
}

@test:Config {}
function test_testLiteralDecimalNegative01() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-0.1).convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimalNegative01");
}

@test:Config {}
function test_testLiteralDecimalNegative01Invalid() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "-0.1.convertsToDecimal()", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testLiteralDecimalNegative01Invalid: expected execution error");
}

@test:Config {}
function test_testLiteralDecimalMax() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1234567890987654321.0.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimalMax");
}

@test:Config {}
function test_testLiteralDecimalStep() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.00000001.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimalStep");
}

@test:Config {}
function test_testLiteralDateYear() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015.is(Date)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateYear");
}

@test:Config {}
function test_testLiteralDateMonth() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02.is(Date)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateMonth");
}

@test:Config {}
function test_testLiteralDateDay() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02-04.is(Date)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateDay");
}

@test:Config {}
function test_testLiteralDateTimeYear() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015T.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeYear");
}

@test:Config {}
function test_testLiteralDateTimeMonth() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02T.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeMonth");
}

@test:Config {}
function test_testLiteralDateTimeDay() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02-04T.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeDay");
}

@test:Config {}
function test_testLiteralDateTimeHour() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02-04T14.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeHour");
}

@test:Config {}
function test_testLiteralDateTimeMinute() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02-04T14:34.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeMinute");
}

@test:Config {}
function test_testLiteralDateTimeSecond() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02-04T14:34:28.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeSecond");
}

@test:Config {}
function test_testLiteralDateTimeMillisecond() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02-04T14:34:28.123.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeMillisecond");
}

@test:Config {}
function test_testLiteralDateTimeUTC() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02-04T14:34:28Z.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeUTC");
}

@test:Config {}
function test_testLiteralDateTimeTimezoneOffset() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2015-02-04T14:34:28+10:00.is(DateTime)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeTimezoneOffset");
}

@test:Config {}
function test_testLiteralTimeHour() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T14.is(Time)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralTimeHour");
}

@test:Config {}
function test_testLiteralTimeMinute() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T14:34.is(Time)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralTimeMinute");
}

@test:Config {}
function test_testLiteralTimeSecond() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T14:34:28.is(Time)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralTimeSecond");
}

@test:Config {}
function test_testLiteralTimeMillisecond() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T14:34:28.123.is(Time)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralTimeMillisecond");
}

@test:Config {}
function test_testLiteralTimeUTC() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T14:34:28Z.is(Time)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testLiteralTimeUTC: expected execution error");
}

@test:Config {}
function test_testLiteralTimeTimezoneOffset() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T14:34:28+10:00.is(Time)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testLiteralTimeTimezoneOffset: expected execution error");
}

@test:Config {}
function test_testLiteralQuantityDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "10.1 'mg'.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralQuantityDecimal");
}

@test:Config {}
function test_testLiteralQuantityInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "10 'mg'.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralQuantityInteger");
}

@test:Config {}
function test_testLiteralQuantityDay() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "4 days.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralQuantityDay");
}

@test:Config {}
function test_testLiteralIntegerNotEqual() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "-3 != 3", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerNotEqual");
}

@test:Config {}
function test_testLiteralIntegerEqual() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.count() = 5", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerEqual");
}

@test:Config {}
function test_testPolarityPrecedence() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "-Patient.name.given.count() = -5", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testPolarityPrecedence");
}

@test:Config {}
function test_testLiteralIntegerGreaterThan() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.count() > -3", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerGreaterThan");
}

@test:Config {}
function test_testLiteralIntegerCountNotEqual() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.count() != 0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerCountNotEqual");
}

@test:Config {}
function test_testLiteralIntegerLessThanTrue() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 < 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerLessThanTrue");
}

@test:Config {}
function test_testLiteralIntegerLessThanFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 < -2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerLessThanFalse");
}

@test:Config {}
function test_testLiteralIntegerLessThanPolarityTrue() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "+1 < +2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerLessThanPolarityTrue");
}

@test:Config {}
function test_testLiteralIntegerLessThanPolarityFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "-1 < 2", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralIntegerLessThanPolarityFalse");
}

@test:Config {}
function test_testLiteralDecimalGreaterThanNonZeroTrue() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.value > 180.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimalGreaterThanNonZeroTrue");
}

@test:Config {}
function test_testLiteralDecimalGreaterThanZeroTrue() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.value > 0.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimalGreaterThanZeroTrue");
}

@test:Config {}
function test_testLiteralDecimalGreaterThanIntegerTrue() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.value > 0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimalGreaterThanIntegerTrue");
}

@test:Config {}
function test_testLiteralDecimalLessThanInteger() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.value < 190", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDecimalLessThanInteger");
}

@test:Config {}
function test_testLiteralDecimalLessThanInvalid() returns error? {
    json 'resource = testSuiteObservationExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Observation.value.value < 'test'", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testLiteralDecimalLessThanInvalid: expected execution error");
}

@test:Config {}
function test_testDateEqual() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate = @1974-12-25", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDateEqual");
}

@test:Config {}
function test_testDateNotEqual() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate != @1974-12-25T12:34:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testDateNotEqual: expected empty result");
}

@test:Config {}
function test_testDateNotEqualTimezoneOffsetBefore() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate != @1974-12-25T12:34:00-10:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testDateNotEqualTimezoneOffsetBefore: expected empty result");
}

@test:Config {}
function test_testDateNotEqualTimezoneOffsetAfter() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate != @1974-12-25T12:34:00+10:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testDateNotEqualTimezoneOffsetAfter: expected empty result");
}

@test:Config {}
function test_testDateNotEqualUTC() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate != @1974-12-25T12:34:00Z", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testDateNotEqualUTC: expected empty result");
}

@test:Config {}
function test_testDateNotEqualTimeSecond() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate != @T12:14:15", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDateNotEqualTimeSecond");
}

@test:Config {}
function test_testDateNotEqualTimeMinute() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate != @T12:14", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDateNotEqualTimeMinute");
}

@test:Config {}
function test_testDateNotEqualToday() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.birthDate < today()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDateNotEqualToday");
}

@test:Config {}
function test_testDateTimeGreaterThanDate1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "now() > Patient.birthDate", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDateTimeGreaterThanDate1");
}

@test:Config {}
function test_testDateGreaterThanDate() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "today() > Patient.birthDate", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDateGreaterThanDate");
}

@test:Config {}
function test_testDateTimeGreaterThanDate2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "now() > today()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testDateTimeGreaterThanDate2: expected empty result");
}

@test:Config {}
function test_testLiteralDateTimeTZGreater() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2017-11-05T01:30:00.0-04:00 > @2017-11-05T01:15:00.0-05:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeTZGreater");
}

@test:Config {}
function test_testLiteralDateTimeTZLess() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2017-11-05T01:30:00.0-04:00 < @2017-11-05T01:15:00.0-05:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeTZLess");
}

@test:Config {}
function test_testLiteralDateTimeTZEqualFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2017-11-05T01:30:00.0-04:00 = @2017-11-05T01:15:00.0-05:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeTZEqualFalse");
}

@test:Config {}
function test_testLiteralDateTimeTZEqualTrue() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2017-11-05T01:30:00.0-04:00 = @2017-11-05T00:30:00.0-05:00", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralDateTimeTZEqualTrue");
}

@test:Config {}
function test_testLiteralUnicode() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.first() = 'P\\u0065ter'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralUnicode");
}

@test:Config {}
function test_testCollectionNotEmpty() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.empty().not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testCollectionNotEmpty");
}

@test:Config {}
function test_testCollectionNotEqualEmpty() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given != {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testCollectionNotEqualEmpty: expected empty result");
}

@test:Config {}
function test_testExpressions() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.select(given | family).distinct()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James", "Chalmers", "Jim", "Windsor"];
    test:assertEquals(result, expected, msg = "test_testExpressions");
}

@test:Config {}
function test_testExpressionsEqual() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.count() = 1 + 4", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testExpressionsEqual");
}

@test:Config {}
function test_testNotEmpty() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.empty().not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testNotEmpty");
}

@test:Config {}
function test_testEmpty() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.link.empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testEmpty");
}

@test:Config {}
function test_testLiteralNotOnEmpty() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.not().empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralNotOnEmpty");
}

@test:Config {}
function test_testLiteralNotTrue() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.not() = false", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralNotTrue");
}

@test:Config {}
function test_testLiteralNotFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "false.not() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testLiteralNotFalse");
}

@test:Config {}
function test_testIntegerBooleanNotTrue() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(0).not() = false", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerBooleanNotTrue");
}

@test:Config {}
function test_testIntegerBooleanNotFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(1).not() = false", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerBooleanNotFalse");
}

@test:Config {}
function test_testNotInvalid() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(1|2).not() = false", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_testNotInvalid: expected execution error");
}
