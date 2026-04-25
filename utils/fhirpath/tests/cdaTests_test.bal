import ballerina/test;

// Group: cdaTests — 

@test:Config {}
function test_testHasTemplateId1() returns error? {
    json 'resource = testSuiteCcda;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/ContinuityofCareDocumentCCD')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testHasTemplateId1");
}

@test:Config {}
function test_testHasTemplateId2() returns error? {
    json 'resource = testSuiteCcda;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "ClinicalDocument.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/ContinuityofCareDocumentCCD')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testHasTemplateId2");
}

@test:Config {}
function test_testHasTemplateId3() returns error? {
    json 'resource = testSuiteCcda;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "recordTarget.patientRole.hasTemplateIdOf('http://hl7.org/cda/us/ccda/StructureDefinition/ContinuityofCareDocumentCCD')", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false];
    test:assertEquals(result, expected, msg = "test_testHasTemplateId3");
}
