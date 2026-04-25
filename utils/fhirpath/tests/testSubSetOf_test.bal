import ballerina/test;

// Group: testSubSetOf — 

@test:Config {}
function test_testSubSetOf1() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.first().subsetOf($this.name)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testSubSetOf1");
}

@test:Config {}
function test_testSubSetOf2() returns error? {
    json 'resource = testSuitePatientExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.subsetOf($this.name.first()).not()", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testSubSetOf2");
}

@test:Config {}
function test_testSubSetOf3() returns error? {
    json 'resource = testSuiteExplanationofbenefitExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "supportingInfo.where(category.coding.code = 'additionalbodysite').sequence.subsetOf($this.item.informationSequence)", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testSubSetOf3");
}
