function getDollarTestCases() returns FHIRPathTestCase[] {
    return [
        {
            name: "test_testDollarThis1",
            group: "testDollar",
            expression: "Patient.name.given.where(substring($this.length()-3) = 'out')",
            resourceKey: "patient",
            expected: [],
            expectError: false
        },
        {
            name: "test_testDollarThis2",
            group: "testDollar",
            expression: "Patient.name.given.where(substring($this.length()-3) = 'ter')",
            resourceKey: "patient",
            expected: ["Peter", "Peter"],
            expectError: false
        },
        {
            name: "test_testDollarOrderAllowed",
            group: "testDollar",
            expression: "Patient.name.skip(1).given",
            resourceKey: "patient",
            expected: ["Jim", "Peter", "James"],
            expectError: false
        },
        {
            name: "test_testDollarOrderAllowedA",
            group: "testDollar",
            expression: "Patient.name.skip(3).given",
            resourceKey: "patient",
            expected: [],
            expectError: false
        },
        {
            name: "test_testDollarOrderNotAllowed",
            group: "testDollar",
            expression: "Patient.children().skip(1)",
            resourceKey: "patient",
            expected: [],
            expectError: true
        }
    ];
}
