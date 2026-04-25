import ballerina/test;

// Group: testMatches — 

@test:Config {}
function test_testMatchesCaseSensitive1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'FHIR'.matches('FHIR')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMatchesCaseSensitive1");
}

@test:Config {}
function test_testMatchesCaseSensitive2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'FHIR'.matches('fhir')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testMatchesCaseSensitive2");
}

@test:Config {}
function test_testMatchesEmpty() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'FHIR'.matches({}).empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMatchesEmpty");
}

@test:Config {}
function test_testMatchesEmpty2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.matches('FHIR').empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMatchesEmpty2");
}

@test:Config {}
function test_testMatchesEmpty3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "{}.matches({}).empty() = true", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMatchesEmpty3");
}

@test:Config {}
function test_testMatchesSingleLineMode1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'A B'.matches('A.*B')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMatchesSingleLineMode1");
}

@test:Config {}
function test_testMatchesWithinUrl1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matches('library')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testMatchesWithinUrl1");
}

@test:Config {}
function test_testMatchesWithinUrl2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matches('Library')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMatchesWithinUrl2");
}

@test:Config {}
function test_testMatchesWithinUrl3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matches('^Library$')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testMatchesWithinUrl3");
}

@test:Config {}
function test_testMatchesWithinUrl1a() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matches('.*Library.*')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMatchesWithinUrl1a");
}

@test:Config {}
function test_testMatchesWithinUrl4() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matches('Measure')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testMatchesWithinUrl4");
}

@test:Config {}
function test_testMatchesFullWithinUrl1() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matchesFull('library')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testMatchesFullWithinUrl1");
}

@test:Config {}
function test_testMatchesFullWithinUrl3() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matchesFull('Library')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testMatchesFullWithinUrl3");
}

@test:Config {}
function test_testMatchesFullWithinUrl4() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matchesFull('^Library$')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testMatchesFullWithinUrl4");
}

@test:Config {}
function test_testMatchesFullWithinUrl1a() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matchesFull('.*Library.*')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMatchesFullWithinUrl1a");
}

@test:Config {}
function test_testMatchesFullWithinUrl2() returns error? {
    json 'resource = {};
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'http://fhir.org/guides/cqf/common/Library/FHIR-ModelInfo|4.0.1'.matchesFull('Measure')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testMatchesFullWithinUrl2");
}
