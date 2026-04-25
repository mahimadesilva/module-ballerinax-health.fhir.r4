import ballerina/test;

// Group: testTypes — 

@test:Config {}
function test_testStringYearConvertsToDate() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015'.convertsToDate()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringYearConvertsToDate");
}

@test:Config {}
function test_testStringMonthConvertsToDate() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02'.convertsToDate()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringMonthConvertsToDate");
}

@test:Config {}
function test_testStringDayConvertsToDate() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02-04'.convertsToDate()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDayConvertsToDate");
}

@test:Config {}
function test_testStringYearConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringYearConvertsToDateTime");
}

@test:Config {}
function test_testStringMonthConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringMonthConvertsToDateTime");
}

@test:Config {}
function test_testStringDayConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02-04'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDayConvertsToDateTime");
}

@test:Config {}
function test_testStringHourConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02-04T14'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringHourConvertsToDateTime");
}

@test:Config {}
function test_testStringMinuteConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02-04T14:34'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringMinuteConvertsToDateTime");
}

@test:Config {}
function test_testStringSecondConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02-04T14:34:28'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringSecondConvertsToDateTime");
}

@test:Config {}
function test_testStringMillisecondConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02-04T14:34:28.123'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringMillisecondConvertsToDateTime");
}

@test:Config {}
function test_testStringUTCConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02-04T14:34:28Z'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringUTCConvertsToDateTime");
}

@test:Config {}
function test_testStringTZConvertsToDateTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'2015-02-04T14:34:28+10:00'.convertsToDateTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringTZConvertsToDateTime");
}

@test:Config {}
function test_testStringHourConvertsToTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'14'.convertsToTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringHourConvertsToTime");
}

@test:Config {}
function test_testStringMinuteConvertsToTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'14:34'.convertsToTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringMinuteConvertsToTime");
}

@test:Config {}
function test_testStringSecondConvertsToTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'14:34:28'.convertsToTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringSecondConvertsToTime");
}

@test:Config {}
function test_testStringMillisecondConvertsToTime() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'14:34:28.123'.convertsToTime()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringMillisecondConvertsToTime");
}

@test:Config {}
function test_testIntegerLiteralConvertsToInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.convertsToInteger()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralConvertsToInteger");
}

@test:Config {}
function test_testIntegerLiteralIsInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.is(Integer)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralIsInteger");
}

@test:Config {}
function test_testIntegerLiteralIsSystemInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.is(System.Integer)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralIsSystemInteger");
}

@test:Config {}
function test_testStringLiteralConvertsToInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1'.convertsToInteger()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringLiteralConvertsToInteger");
}

@test:Config {}
function test_testStringLiteralConvertsToIntegerFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'a'.convertsToInteger().not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringLiteralConvertsToIntegerFalse");
}

@test:Config {}
function test_testStringDecimalConvertsToIntegerFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.0'.convertsToInteger().not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDecimalConvertsToIntegerFalse");
}

@test:Config {}
function test_testStringLiteralIsNotInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1'.is(Integer).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringLiteralIsNotInteger");
}

@test:Config {}
function test_testBooleanLiteralConvertsToInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.convertsToInteger()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralConvertsToInteger");
}

@test:Config {}
function test_testBooleanLiteralIsNotInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.is(Integer).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralIsNotInteger");
}

@test:Config {}
function test_testDateIsNotInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2013-04-05.is(Integer).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDateIsNotInteger");
}

@test:Config {}
function test_testIntegerLiteralToInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.toInteger() = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralToInteger");
}

@test:Config {}
function test_testStringIntegerLiteralToInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1'.toInteger() = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringIntegerLiteralToInteger");
}

@test:Config {}
function test_testDecimalLiteralToInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.1'.toInteger() = {}", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testDecimalLiteralToInteger: expected empty result");
}

@test:Config {}
function test_testDecimalLiteralToIntegerIsEmpty() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.1'.toInteger().empty()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralToIntegerIsEmpty");
}

@test:Config {}
function test_testBooleanLiteralToInteger() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.toInteger() = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralToInteger");
}

@test:Config {}
function test_testIntegerLiteralConvertsToDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralConvertsToDecimal");
}

@test:Config {}
function test_testIntegerLiteralIsNotDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.is(Decimal).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralIsNotDecimal");
}

@test:Config {}
function test_testDecimalLiteralConvertsToDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralConvertsToDecimal");
}

@test:Config {}
function test_testDecimalLiteralIsDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.is(Decimal)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralIsDecimal");
}

@test:Config {}
function test_testStringIntegerLiteralConvertsToDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1'.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringIntegerLiteralConvertsToDecimal");
}

@test:Config {}
function test_testStringIntegerLiteralIsNotDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1'.is(Decimal).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringIntegerLiteralIsNotDecimal");
}

@test:Config {}
function test_testStringLiteralConvertsToDecimalFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.a'.convertsToDecimal().not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringLiteralConvertsToDecimalFalse");
}

@test:Config {}
function test_testStringDecimalLiteralConvertsToDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.0'.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDecimalLiteralConvertsToDecimal");
}

@test:Config {}
function test_testStringDecimalLiteralIsNotDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.0'.is(Decimal).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDecimalLiteralIsNotDecimal");
}

@test:Config {}
function test_testBooleanLiteralConvertsToDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.convertsToDecimal()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralConvertsToDecimal");
}

@test:Config {}
function test_testBooleanLiteralIsNotDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.is(Decimal).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralIsNotDecimal");
}

@test:Config {}
function test_testIntegerLiteralToDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.toDecimal() = 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralToDecimal");
}

@test:Config {}
function test_testIntegerLiteralToDeciamlEquivalent() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.toDecimal() ~ 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralToDeciamlEquivalent");
}

@test:Config {}
function test_testDecimalLiteralToDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.toDecimal() = 1.0", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralToDecimal");
}

@test:Config {}
function test_testDecimalLiteralToDecimalEqual() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.1'.toDecimal() = 1.1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralToDecimalEqual");
}

@test:Config {}
function test_testBooleanLiteralToDecimal() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.toDecimal() = 1", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralToDecimal");
}

@test:Config {}
function test_testIntegerLiteralConvertsToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralConvertsToQuantity");
}

@test:Config {}
function test_testIntegerLiteralIsNotQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.is(Quantity).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralIsNotQuantity");
}

@test:Config {}
function test_testDecimalLiteralConvertsToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralConvertsToQuantity");
}

@test:Config {}
function test_testDecimalLiteralIsNotQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.is(System.Quantity).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralIsNotQuantity");
}

@test:Config {}
function test_testStringIntegerLiteralConvertsToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1'.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringIntegerLiteralConvertsToQuantity");
}

@test:Config {}
function test_testStringIntegerLiteralIsNotQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1'.is(System.Quantity).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringIntegerLiteralIsNotQuantity");
}

@test:Config {}
function test_testStringQuantityLiteralConvertsToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1 day'.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringQuantityLiteralConvertsToQuantity");
}

@test:Config {}
function test_testStringQuantityWeekConvertsToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1 \\'wk\\''.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringQuantityWeekConvertsToQuantity");
}

@test:Config {}
function test_testStringQuantityWeekConvertsToQuantityFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1 wk'.convertsToQuantity().not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringQuantityWeekConvertsToQuantityFalse");
}

@test:Config {}
function test_testStringDecimalLiteralConvertsToQuantityFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.a'.convertsToQuantity().not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDecimalLiteralConvertsToQuantityFalse");
}

@test:Config {}
function test_testStringDecimalLiteralConvertsToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.0'.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDecimalLiteralConvertsToQuantity");
}

@test:Config {}
function test_testStringDecimalLiteralIsNotSystemQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.0'.is(System.Quantity).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDecimalLiteralIsNotSystemQuantity");
}

@test:Config {}
function test_testBooleanLiteralConvertsToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.convertsToQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralConvertsToQuantity");
}

@test:Config {}
function test_testBooleanLiteralIsNotSystemQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.is(System.Quantity).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralIsNotSystemQuantity");
}

@test:Config {}
function test_testIntegerLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.toQuantity() = 1 '1'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralToQuantity");
}

@test:Config {}
function test_testDecimalLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.toQuantity() = 1.0 '1'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralToQuantity");
}

@test:Config {}
function test_testStringIntegerLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1'.toQuantity()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1 '1'"];
    test:assertEquals(result, expected, msg = "test_testStringIntegerLiteralToQuantity");
}

@test:Config {}
function test_testStringQuantityLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1 day'.toQuantity() = 1 day", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringQuantityLiteralToQuantity");
}

@test:Config {}
function test_testStringQuantityDayLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1 day'.toQuantity() = 1 'd'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringQuantityDayLiteralToQuantity");
}

@test:Config {}
function test_testStringQuantityWeekLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1 \\'wk\\''.toQuantity() = 1 week", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringQuantityWeekLiteralToQuantity");
}

@test:Config {}
function test_testStringQuantityMonthLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1 \\'mo\\''.toQuantity() = 1 month", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testStringQuantityMonthLiteralToQuantity: expected empty result");
}

@test:Config {}
function test_testStringQuantityYearLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1 \\'a\\''.toQuantity() = 1 year", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testStringQuantityYearLiteralToQuantity: expected empty result");
}

@test:Config {}
function test_testStringDecimalLiteralToQuantity() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'1.0'.toQuantity() ~ 1 '1'", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringDecimalLiteralToQuantity");
}

@test:Config {}
function test_testIntegerLiteralConvertsToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralConvertsToBoolean");
}

@test:Config {}
function test_testIntegerLiteralConvertsToBooleanFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralConvertsToBooleanFalse");
}

@test:Config {}
function test_testNegativeIntegerLiteralConvertsToBooleanFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1).convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testNegativeIntegerLiteralConvertsToBooleanFalse");
}

@test:Config {}
function test_testIntegerLiteralFalseConvertsToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralFalseConvertsToBoolean");
}

@test:Config {}
function test_testDecimalLiteralConvertsToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralConvertsToBoolean");
}

@test:Config {}
function test_testStringTrueLiteralConvertsToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'true'.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringTrueLiteralConvertsToBoolean");
}

@test:Config {}
function test_testStringFalseLiteralConvertsToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'false'.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringFalseLiteralConvertsToBoolean");
}

@test:Config {}
function test_testStringFalseLiteralAlsoConvertsToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'False'.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringFalseLiteralAlsoConvertsToBoolean");
}

@test:Config {}
function test_testTrueLiteralConvertsToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testTrueLiteralConvertsToBoolean");
}

@test:Config {}
function test_testFalseLiteralConvertsToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "false.convertsToBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testFalseLiteralConvertsToBoolean");
}

@test:Config {}
function test_testIntegerLiteralToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.toBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralToBoolean");
}

@test:Config {}
function test_testIntegerLiteralToBooleanEmpty() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "2.toBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_testIntegerLiteralToBooleanEmpty: expected empty result");
}

@test:Config {}
function test_testIntegerLiteralToBooleanFalse() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.toBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralToBooleanFalse");
}

@test:Config {}
function test_testStringTrueToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'true'.toBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringTrueToBoolean");
}

@test:Config {}
function test_testStringFalseToBoolean() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'false'.toBoolean()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testStringFalseToBoolean");
}

@test:Config {}
function test_testIntegerLiteralConvertsToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.convertsToString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralConvertsToString");
}

@test:Config {}
function test_testIntegerLiteralIsNotString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.is(String).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralIsNotString");
}

@test:Config {}
function test_testNegativeIntegerLiteralConvertsToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1).convertsToString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testNegativeIntegerLiteralConvertsToString");
}

@test:Config {}
function test_testDecimalLiteralConvertsToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.convertsToString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralConvertsToString");
}

@test:Config {}
function test_testStringLiteralConvertsToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'true'.convertsToString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testStringLiteralConvertsToString");
}

@test:Config {}
function test_testBooleanLiteralConvertsToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.convertsToString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralConvertsToString");
}

@test:Config {}
function test_testQuantityLiteralConvertsToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 'wk'.convertsToString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testQuantityLiteralConvertsToString");
}

@test:Config {}
function test_testIntegerLiteralToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.toString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1"];
    test:assertEquals(result, expected, msg = "test_testIntegerLiteralToString");
}

@test:Config {}
function test_testNegativeIntegerLiteralToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1).toString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["-1"];
    test:assertEquals(result, expected, msg = "test_testNegativeIntegerLiteralToString");
}

@test:Config {}
function test_testDecimalLiteralToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.0.toString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1.0"];
    test:assertEquals(result, expected, msg = "test_testDecimalLiteralToString");
}

@test:Config {}
function test_testStringLiteralToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'true'.toString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["true"];
    test:assertEquals(result, expected, msg = "test_testStringLiteralToString");
}

@test:Config {}
function test_testBooleanLiteralToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "true.toString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["true"];
    test:assertEquals(result, expected, msg = "test_testBooleanLiteralToString");
}

@test:Config {}
function test_testQuantityLiteralWkToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 'wk'.toString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1 'wk'"];
    test:assertEquals(result, expected, msg = "test_testQuantityLiteralWkToString");
}

@test:Config {}
function test_testQuantityLiteralWeekToString() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 week.toString()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1 week"];
    test:assertEquals(result, expected, msg = "test_testQuantityLiteralWeekToString");
}
