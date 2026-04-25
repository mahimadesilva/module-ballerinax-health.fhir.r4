import ballerina/test;

// Group: miscEngineTests — 

@test:Config {}
function test_testContainedId() returns error? {
    json 'resource = testSuitePatientContainerExample;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "contained.id", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = ["1"];
    test:assertEquals(result, expected, msg = "test_testContainedId");
}

@test:Config {}
function test_testMultipleResolve() returns error? {
    json 'resource = testSuiteDiagnosticreportEric;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "composition.exists() implies ( composition.resolve().section.entry.reference.where(resolve() is Observation) .where($this in (%resource.result.reference | %resource.result.reference.resolve().hasMember.reference)).exists() )", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [true];
    test:assertEquals(result, expected, msg = "test_testMultipleResolve");
}

@test:Config {}
function test_testPrimitiveExtensions() returns error? {
    json 'resource = testSuitePatientNameExtensions;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.select($this.hasValue())", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false, true];
    test:assertEquals(result, expected, msg = "test_testPrimitiveExtensions");
}

@test:Config {}
function test_testPrimitiveExtensionsElement() returns error? {
    json 'resource = testSuitePatientNameExtensions;
    json[]|FHIRPathError result =
        getValuesFromFhirPath('resource, "Patient.name.given.select($this.hasValue())", false);
    if result is FHIRPathError {
        test:assertFail(msg = "Unexpected FHIRPath error");
    }
    json[] expected = [false, true];
    test:assertEquals(result, expected, msg = "test_testPrimitiveExtensionsElement");
}
