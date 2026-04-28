function getBasicsTestCases() returns FHIRPathTestCase[] {
    return [
        {
            name: "test_testSimple",
            group: "testBasics",
            expression: "name.given",
            resourceKey: "patient",
            expected: ["Peter", "James", "Jim", "Peter", "James"],
            expectError: false
        },
        {
            name: "test_testSimpleNone",
            group: "testBasics",
            expression: "name.suffix",
            resourceKey: "patient",
            expected: [],
            expectError: false
        },
        {
            name: "test_testEscapedIdentifier",
            group: "testBasics",
            expression: "name.`given`",
            resourceKey: "patient",
            expected: ["Peter", "James", "Jim", "Peter", "James"],
            expectError: false
        },
        {
            name: "test_testSimpleBackTick1",
            group: "testBasics",
            expression: "`Patient`.name.`given`",
            resourceKey: "patient",
            expected: ["Peter", "James", "Jim", "Peter", "James"],
            expectError: false
        },
        {
            name: "test_testSimpleFail",
            group: "testBasics",
            expression: "name.given1",
            resourceKey: "patient",
            expected: [],
            expectError: true
        },
        {
            name: "test_testSimpleWithContext",
            group: "testBasics",
            expression: "Patient.name.given",
            resourceKey: "patient",
            expected: ["Peter", "James", "Jim", "Peter", "James"],
            expectError: false
        },
        {
            name: "test_testSimpleWithWrongContext",
            group: "testBasics",
            expression: "Encounter.name.given",
            resourceKey: "patient",
            expected: [],
            expectError: true
        }
    ];
}
