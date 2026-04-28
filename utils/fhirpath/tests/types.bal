type FHIRPathTestCase record {|
    string name;
    string group;
    string expression;
    string resourceKey;
    json[] expected;
    boolean expectError;
|};

type TestResult record {|
    string name;
    string group;
    string status;
    string? failureReason;
    json[]? actualResult;
    json[]? expectedResult;
|};

type TestReport record {|
    int total;
    int passed;
    int failed;
    string[] failedNames;
    TestResult[] results;
|};
