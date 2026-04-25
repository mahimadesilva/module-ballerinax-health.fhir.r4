import ballerina/test;

// Group: testEscapeUnescape — 

@test:Config {}
function test_testEscapeHtml() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'\"1<2\"'.escape('html')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["&quot;1&lt;2&quot;"];
    test:assertEquals(result, expected, msg = "test_testEscapeHtml");
}

@test:Config {}
function test_testEscapeJson() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'\"1<2\"'.escape('json')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["\\\"1<2\\\""];
    test:assertEquals(result, expected, msg = "test_testEscapeJson");
}

@test:Config {}
function test_testUnescapeHtml() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'&quot;1&lt;2&quot;'.unescape('html')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["\"1<2\""];
    test:assertEquals(result, expected, msg = "test_testUnescapeHtml");
}

@test:Config {}
function test_testUnescapeJson() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'\\\"1<2\\\"'.unescape('json')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["\"1<2\""];
    test:assertEquals(result, expected, msg = "test_testUnescapeJson");
}
