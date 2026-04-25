import ballerina/test;

// Group: TerminologyTests — 

@test:Config {}
function test_txTest01() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "%terminologies.expand('http://hl7.org/fhir/ValueSet/administrative-gender').expansion.contains.count()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [4];
    test:assertEquals(result, expected, msg = "test_txTest01");
}

@test:Config {}
function test_txTest02() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "%terminologies.validateVS('http://hl7.org/fhir/ValueSet/administrative-gender', $this.gender).parameter.where(name = 'result').value", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_txTest02");
}

@test:Config {}
function test_txTest03() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "%terminologies.translate('http://hl7.org/fhir/ConceptMap/cm-address-use-v2', $this.address.use).parameter.where(name = 'match').part.where(name = 'concept').value.code", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["H"];
    test:assertEquals(result, expected, msg = "test_txTest03");
}
