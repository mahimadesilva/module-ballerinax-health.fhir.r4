import ballerina/test;

// Group: HighBoundary — 

@test:Config {}
function test_HighBoundaryDecimalDefault() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.highBoundary()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.58750000];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimalDefault");
}

@test:Config {}
function test_HighBoundaryDecimal1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.highBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.59];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal1");
}

@test:Config {}
function test_HighBoundaryDecimal2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.highBoundary(6)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.587500];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal2");
}

@test:Config {}
function test_HighBoundaryDecimal3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.highBoundary(-1)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_HighBoundaryDecimal3: expected empty result");
}

@test:Config {}
function test_HighBoundaryDecimal4() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).highBoundary()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-1.58650000];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal4");
}

@test:Config {}
function test_HighBoundaryDecimal5() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).highBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-1.58];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal5");
}

@test:Config {}
function test_HighBoundaryDecimal6() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).highBoundary(6)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-1.586500];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal6");
}

@test:Config {}
function test_HighBoundaryDecimal7() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.highBoundary(39)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_HighBoundaryDecimal7: expected empty result");
}

@test:Config {}
function test_HighBoundaryDecimal8() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.highBoundary()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.50000000];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal8");
}

@test:Config {}
function test_HighBoundaryDecimal9() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.highBoundary(0)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [2];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal9");
}

@test:Config {}
function test_HighBoundaryDecimal10() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.highBoundary(5)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.50000];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal10");
}

@test:Config {}
function test_HighBoundaryDecimal11() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "12.587.highBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [12.59];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal11");
}

@test:Config {}
function test_HighBoundaryDecimal12() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "12.500.highBoundary(4)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [12.5005];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal12");
}

@test:Config {}
function test_HighBoundaryDecimal13() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "120.highBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [120.50];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal13");
}

@test:Config {}
function test_HighBoundaryDecimal14() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "-120.highBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-120.50];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal14");
}

@test:Config {}
function test_HighBoundaryDecimal15() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.0034.highBoundary(1)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [0.0];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal15");
}

@test:Config {}
function test_HighBoundaryDecimal16() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "-0.0034.highBoundary(1)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [0.0];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal16");
}

@test:Config {}
function test_HighBoundaryDecimal() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.highBoundary(8)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.58750000];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDecimal");
}

@test:Config {}
function test_HighBoundaryQuantity() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587 'm'.highBoundary(8)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1.58750000 'm'"];
    test:assertEquals(result, expected, msg = "test_HighBoundaryQuantity");
}

@test:Config {}
function test_HighBoundaryDateMonth() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014.highBoundary(6)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@2014-12"];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDateMonth");
}

@test:Config {}
function test_HighBoundaryDateTimeMillisecond1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-01-01T08.highBoundary(17)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@2014-01-01T08:00:59.999-12:00"];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDateTimeMillisecond1");
}

@test:Config {}
function test_HighBoundaryDateTimeMillisecond2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-01-01T08:05-05:00.highBoundary(17)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@2014-01-01T08:05:59.999-05:00"];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDateTimeMillisecond2");
}

@test:Config {}
function test_HighBoundaryDateTimeMillisecond3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-01-01T08.highBoundary(17)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@2014-01-01T08:00:59.999-12:00"];
    test:assertEquals(result, expected, msg = "test_HighBoundaryDateTimeMillisecond3");
}

@test:Config {}
function test_HighBoundaryTimeMillisecond() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30.highBoundary(9)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@T10:30:59.999"];
    test:assertEquals(result, expected, msg = "test_HighBoundaryTimeMillisecond");
}
