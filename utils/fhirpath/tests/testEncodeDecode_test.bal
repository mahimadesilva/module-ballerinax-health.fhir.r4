import ballerina/test;

// Group: testEncodeDecode — 

@test:Config {}
function test_testEncodeBase64A() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'test'.encode('base64')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["dGVzdA=="];
    test:assertEquals(result, expected, msg = "test_testEncodeBase64A");
}

@test:Config {}
function test_testEncodeHex() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'test'.encode('hex')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["74657374"];
    test:assertEquals(result, expected, msg = "test_testEncodeHex");
}

@test:Config {}
function test_testEncodeBase64B() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'subjects?_d'.encode('base64')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["c3ViamVjdHM/X2Q="];
    test:assertEquals(result, expected, msg = "test_testEncodeBase64B");
}

@test:Config {}
function test_testEncodeUrlBase64() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'subjects?_d'.encode('urlbase64')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["c3ViamVjdHM_X2Q="];
    test:assertEquals(result, expected, msg = "test_testEncodeUrlBase64");
}

@test:Config {}
function test_testDecodeBase64A() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'dGVzdA=='.decode('base64')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["test"];
    test:assertEquals(result, expected, msg = "test_testDecodeBase64A");
}

@test:Config {}
function test_testDecodeHex() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'74657374'.decode('hex')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["test"];
    test:assertEquals(result, expected, msg = "test_testDecodeHex");
}

@test:Config {}
function test_testDecodeBase64B() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'c3ViamVjdHM/X2Q='.decode('base64')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["subjects?_d"];
    test:assertEquals(result, expected, msg = "test_testDecodeBase64B");
}

@test:Config {}
function test_testDecodeUrlBase64() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "'c3ViamVjdHM_X2Q='.decode('urlbase64')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["subjects?_d"];
    test:assertEquals(result, expected, msg = "test_testDecodeUrlBase64");
}
