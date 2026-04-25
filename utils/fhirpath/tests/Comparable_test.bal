import ballerina/test;

// Group: Comparable — 

@test:Config {}
function test_Comparable1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 'cm'.comparable(1 '[in_i]')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_Comparable1");
}

@test:Config {}
function test_Comparable2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 'cm'.comparable(1 '[s]')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_Comparable2");
}

@test:Config {}
function test_Comparable3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "1 'cm'.comparable(1 's')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_Comparable3");
}
