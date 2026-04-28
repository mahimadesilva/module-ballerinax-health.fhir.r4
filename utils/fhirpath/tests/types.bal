type FHIRPathTestCase record {|
    string name;
    string group;
    string expression;
    string resourceKey;
    json[] expected;
    boolean expectError;
    boolean disabled = false;
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
    int skipped;
    string[] failedNames;
    TestResult[] results;
|};
