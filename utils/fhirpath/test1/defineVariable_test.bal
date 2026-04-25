import ballerina/test;

// Group: defineVariable — defineVariable tests

@test:Config {}
function test_defineVariable1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('v1', 'value1').select(%v1)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["value1"];
    test:assertEquals(result, expected, msg = "test_defineVariable1");
}

@test:Config {}
function test_defineVariable2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('n1', name.first()).select(%n1.given)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James"];
    test:assertEquals(result, expected, msg = "test_defineVariable2");
}

@test:Config {}
function test_defineVariable3() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('n1', name.first()).select(%n1.given).first()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter"];
    test:assertEquals(result, expected, msg = "test_defineVariable3");
}

@test:Config {}
function test_defineVariable4() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('n1', name.first()).select(%n1.given) | defineVariable('n1', name.skip(1).first()).select(%n1.given)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Peter", "James", "Jim"];
    test:assertEquals(result, expected, msg = "test_defineVariable4");
}

@test:Config {}
function test_defineVariable5() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('n1', name.first()).where(active.not()) | defineVariable('n1', name.skip(1).first()).select(%n1.given)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["Jim"];
    test:assertEquals(result, expected, msg = "test_defineVariable5");
}

@test:Config {}
function test_defineVariable6() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('n1', name.first()).select(id & '-' & %n1.given.join('|')) | defineVariable('n2', name.skip(1).first()).select(%n2.given)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["example-Peter|James", "Jim"];
    test:assertEquals(result, expected, msg = "test_defineVariable6");
}

@test:Config {}
function test_defineVariable7() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('n1', name.first()).active | defineVariable('n2', name.skip(1).first()).select(%n2.given)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true, "Jim"];
    test:assertEquals(result, expected, msg = "test_defineVariable7");
}

@test:Config {}
function test_defineVariable8() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('v1', 'value1').select(%v1).trace('data').defineVariable('v2', 'value2').select($this & ':' & %v1 & '-' & %v2) | defineVariable('v3', 'value3').select(%v3)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["value1:value1-value2", "value3"];
    test:assertEquals(result, expected, msg = "test_defineVariable8");
}

@test:Config {}
function test_defineVariable9() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('n1', name.first()).active | defineVariable('n2', name.skip(1).first()).select(%n1.given)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_defineVariable9: expected semantic error");
}

@test:Config {}
function test_defineVariable10() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "select(%fam.given)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_defineVariable10: expected semantic error");
}

@test:Config {}
function test_dvRedefiningVariableThrowsError() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('v1').defineVariable('v1').select(%v1)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_dvRedefiningVariableThrowsError: expected semantic error");
}

@test:Config {}
function test_defineVariable12() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.defineVariable('n1', first()).active | Patient.name.defineVariable('n2', skip(1).first()).select(%n1.given)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_defineVariable12: expected semantic error");
}

@test:Config {}
function test_defineVariable13() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.defineVariable('n2', skip(1).first()).defineVariable('res', %n2.given+%n2.given).select(%res)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["JimJim", "JimJim", "JimJim"];
    test:assertEquals(result, expected, msg = "test_defineVariable13");
}

@test:Config {}
function test_defineVariable14() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.defineVariable('n1', first()).select(%n1).exists() | Patient.name.defineVariable('n2', skip(1).first()).defineVariable('res', %n2.given+%n2.given).select(%res)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true, "JimJim"];
    test:assertEquals(result, expected, msg = "test_defineVariable14");
}

@test:Config {}
function test_defineVariable15() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('root', 'r1-').select(defineVariable('v1', 'v1').defineVariable('v2', 'v2').select(%v1 | %v2)).select(%root & $this)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["r1-v1", "r1-v2"];
    test:assertEquals(result, expected, msg = "test_defineVariable15");
}

@test:Config {}
function test_defineVariable16() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('root', 'r1-').select(defineVariable('v1', 'v1').defineVariable('v2', 'v2').select(%v1 | %v2)).select(%root & $this & %v1)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_defineVariable16: expected semantic error");
}

@test:Config {}
function test_dvCantOverwriteSystemVar() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('context', 'oops')", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_dvCantOverwriteSystemVar: expected semantic error");
}

@test:Config {}
function test_dvConceptMapExample() returns error? {
    json 'resource = testSuiteConceptmapExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "group.select( defineVariable('grp') .element .select( defineVariable('ele') .target .select(%grp.source & '|' & %ele.code & ' ' & relationship & ' ' & %grp.target & '|' & code) ) ) .trace('all') .isDistinct()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_dvConceptMapExample");
}

@test:Config {}
function test_defineVariable19() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable(defineVariable('param','ppp').select(%param), defineVariable('param','value').select(%param)).select(%ppp)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["value"];
    test:assertEquals(result, expected, msg = "test_defineVariable19");
}

@test:Config {}
function test_dvParametersDontColide() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'aaa'.replace(defineVariable('param', 'aaa').select(%param), defineVariable('param','bbb').select(%param))", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["bbb"];
    test:assertEquals(result, expected, msg = "test_dvParametersDontColide");
}

@test:Config {}
function test_dvUsageOutsideScopeThrows() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "defineVariable('n1', 'v1').active | defineVariable('n2', 'v2').select(%n1)", false);
    test:assertTrue(result is FHIRPathError,
        msg = "test_dvUsageOutsideScopeThrows: expected semantic error");
}
