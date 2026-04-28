function getDatetimeTestCases() returns FHIRPathTestCase[] {
    return [
        {
            name: "test_testNow1",
            group: "testNow",
            expression: "Patient.birthDate < now()",
            resourceKey: "patient",
            expected: [true],
            expectError: false
        },
        {
            name: "test_testNow2",
            group: "testNow",
            expression: "now().toString().length() > 10",
            resourceKey: "patient",
            expected: [true],
            expectError: false
        },
        {
            name: "test_testToday1",
            group: "testToday",
            expression: "Patient.birthDate < today()",
            resourceKey: "patient",
            expected: [true],
            expectError: false
        },
        {
            name: "test_testToday2",
            group: "testToday",
            expression: "today().toString().length() = 10",
            resourceKey: "patient",
            expected: [true],
            expectError: false,
            // TODO: enable once implementation supports this
            disabled: true
        },
        {
            name: "test_testPeriodInvariantOld",
            group: "period",
            expression: "Patient.identifier.period.all(start.hasValue().not() or end.hasValue().not() or (start <= end))",
            resourceKey: "patient_period",
            expected: [false],
            expectError: false,
            // TODO: enable once implementation supports this
            disabled: true
        },
        {
            name: "test_testPeriodInvariantNew",
            group: "period",
            expression: "Patient.identifier.period.all(start.empty() or end.empty() or (start.lowBoundary() < end.highBoundary()))",
            resourceKey: "patient_period",
            expected: [true],
            expectError: false
        }
    ];
}
