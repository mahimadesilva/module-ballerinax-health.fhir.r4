function getExtensionsTestCases() returns FHIRPathTestCase[] {
    return [
        {
            name: "test_testExtension1",
            group: "testExtension",
            expression: "Patient.birthDate.extension('http://hl7.org/fhir/StructureDefinition/patient-birthTime').exists()",
            resourceKey: "patient",
            expected: [true],
            expectError: false
        },
        {
            name: "test_testExtension2",
            group: "testExtension",
            expression: "Patient.birthDate.extension(%`ext-patient-birthTime`).exists()",
            resourceKey: "patient",
            expected: [true],
            expectError: false
        },
        {
            name: "test_testExtension3",
            group: "testExtension",
            expression: "Patient.birthDate.extension('http://hl7.org/fhir/StructureDefinition/patient-birthTime1').empty()",
            resourceKey: "patient",
            expected: [true],
            expectError: false
        },
        {
            name: "test_testConformsTo1",
            group: "testConformsTo",
            expression: "conformsTo('http://hl7.org/fhir/StructureDefinition/Patient')",
            resourceKey: "patient",
            expected: [true],
            expectError: false
        },
        {
            name: "test_testConformsTo2",
            group: "testConformsTo",
            expression: "conformsTo('http://hl7.org/fhir/StructureDefinition/Person')",
            resourceKey: "patient",
            expected: [false],
            expectError: false
        },
        {
            name: "test_testConformsTo3",
            group: "testConformsTo",
            expression: "conformsTo('http://trash')",
            resourceKey: "patient",
            expected: [],
            expectError: true
        },
        {
            name: "test_txTest01",
            group: "TerminologyTests",
            expression: "%terminologies.expand('http://hl7.org/fhir/ValueSet/administrative-gender').expansion.contains.count()",
            resourceKey: "patient",
            expected: [4],
            expectError: false
        },
        {
            name: "test_txTest02",
            group: "TerminologyTests",
            expression: "%terminologies.validateVS('http://hl7.org/fhir/ValueSet/administrative-gender', $this.gender).parameter.where(name = 'result').value",
            resourceKey: "patient",
            expected: [true],
            expectError: false
        },
        {
            name: "test_txTest03",
            group: "TerminologyTests",
            expression: "%terminologies.translate('http://hl7.org/fhir/ConceptMap/cm-address-use-v2', $this.address.use).parameter.where(name = 'match').part.where(name = 'concept').value.code",
            resourceKey: "patient",
            expected: ["H"],
            expectError: false
        }
    ];
}
