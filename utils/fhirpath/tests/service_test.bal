import ballerina/http;
import ballerina/log;
import ballerina/test;

http:Client testClient = check new ("http://localhost:9876");

@test:Config {}
function runStandardFhirPathTestSuite() returns error? {
    json response = check testClient->get("/fhirpath/run");
    TestReport report = check response.cloneWithType(TestReport);

    log:printInfo("FHIRPath test run complete",
            total = report.total, passed = report.passed,
            failed = report.failed, skipped = report.skipped);

    foreach string failedName in report.failedNames {
        TestResult[] matching = from TestResult r in report.results
            where r.name == failedName
            select r;
        if matching.length() > 0 {
            TestResult r = matching[0];
            log:printError("FAIL: " + failedName,
                    'group = r.group,
                    reason = r.failureReason ?: "unknown",
                    expected = (r.expectedResult ?: []).toJsonString(),
                    actual = (r.actualResult ?: []).toJsonString());
        }
    }

    if report.failed > 0 {
        test:assertFail(msg = report.failed.toString() + " FHIRPath test(s) failed. "
                + "Failed: " + string:'join(", ", ...report.failedNames));
    }
}
