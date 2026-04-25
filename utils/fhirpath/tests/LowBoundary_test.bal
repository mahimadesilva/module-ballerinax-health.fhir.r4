import ballerina/test;

// Group: LowBoundary — 

@test:Config {}
function test_LowBoundaryDecimalDefault() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.lowBoundary()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.58650000];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimalDefault");
}

@test:Config {}
function test_LowBoundaryDecimal1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.lowBoundary(6)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.586500];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal1");
}

@test:Config {}
function test_LowBoundaryDecimal2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.lowBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1.58];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal2");
}

@test:Config {}
function test_LowBoundaryDecimal3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.lowBoundary(-1)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_LowBoundaryDecimal3: expected empty result");
}

@test:Config {}
function test_LowBoundaryDecimal4() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.lowBoundary(0)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [1];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal4");
}

@test:Config {}
function test_LowBoundaryDecimal5() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.lowBoundary(32)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_LowBoundaryDecimal5: expected empty result");
}

@test:Config {}
function test_LowBoundaryNegDecimalDefault() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).lowBoundary()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-1.58750000];
    test:assertEquals(result, expected, msg = "test_LowBoundaryNegDecimalDefault");
}

@test:Config {}
function test_LowBoundaryNegDecimal1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).lowBoundary(6)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-1.587500];
    test:assertEquals(result, expected, msg = "test_LowBoundaryNegDecimal1");
}

@test:Config {}
function test_LowBoundaryNegDecimal2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).lowBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-1.59];
    test:assertEquals(result, expected, msg = "test_LowBoundaryNegDecimal2");
}

@test:Config {}
function test_LowBoundaryNegDecimal3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).lowBoundary(-1)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_LowBoundaryNegDecimal3: expected empty result");
}

@test:Config {}
function test_LowBoundaryNegDecimal4() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).lowBoundary(0)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-2];
    test:assertEquals(result, expected, msg = "test_LowBoundaryNegDecimal4");
}

@test:Config {}
function test_LowBoundaryNegDecimal5() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-1.587).lowBoundary(32)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_LowBoundaryNegDecimal5: expected empty result");
}

@test:Config {}
function test_LowBoundaryDecimal6() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587.lowBoundary(39)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    test:assertEquals(result.length(), 0, msg = "test_LowBoundaryDecimal6: expected empty result");
}

@test:Config {}
function test_LowBoundaryDecimal7() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.toDecimal().lowBoundary()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [0.50000000];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal7");
}

@test:Config {}
function test_LowBoundaryDecimal8() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.lowBoundary(0)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [0];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal8");
}

@test:Config {}
function test_LowBoundaryDecimal9() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.lowBoundary(5)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [0.50000];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal9");
}

@test:Config {}
function test_LowBoundaryDecimal10() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "12.587.lowBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [12.58];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal10");
}

@test:Config {}
function test_LowBoundaryDecimal11() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "12.500.lowBoundary(4)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [12.4995];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal11");
}

@test:Config {}
function test_LowBoundaryDecimal12() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "120.lowBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [119.50];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal12");
}

@test:Config {}
function test_LowBoundaryDecimal13() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-120).lowBoundary(2)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-120.50];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal13");
}

@test:Config {}
function test_LowBoundaryDecimal14() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "0.0034.lowBoundary(1)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [0.0];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal14");
}

@test:Config {}
function test_LowBoundaryDecimal15() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "(-0.0034).lowBoundary(1)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [-0.0];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDecimal15");
}

@test:Config {}
function test_LowBoundaryQuantity() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1.587 'cm'.lowBoundary(8)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1.58650000 'cm'"];
    test:assertEquals(result, expected, msg = "test_LowBoundaryQuantity");
}

@test:Config {}
function test_LowBoundaryDateMonth() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014.lowBoundary(6)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@2014-01"];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDateMonth");
}

@test:Config {}
function test_LowBoundaryDateTimeMillisecond1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-01-01T08.lowBoundary(17)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@2014-01-01T08:00:00.000+14:00"];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDateTimeMillisecond1");
}

@test:Config {}
function test_LowBoundaryDateTimeMillisecond2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-01-01T08:05+08:00.lowBoundary(17)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@2014-01-01T08:05:00.000+08:00"];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDateTimeMillisecond2");
}

@test:Config {}
function test_LowBoundaryDateTimeMillisecond3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@2014-01-01T08.lowBoundary(8)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@2014-01-01"];
    test:assertEquals(result, expected, msg = "test_LowBoundaryDateTimeMillisecond3");
}

@test:Config {}
function test_LowBoundaryTimeMillisecond() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "@T10:30.lowBoundary(9)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["@T10:30:00.000"];
    test:assertEquals(result, expected, msg = "test_LowBoundaryTimeMillisecond");
}
