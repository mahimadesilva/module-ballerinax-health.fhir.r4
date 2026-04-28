import ballerina/http;

service /fhirpath on new http:Listener(9876) {

    resource function get run() returns json {
        TestReport report = runCases(getAllTestCases());
        return report.toJson();
    }

    resource function get run/group/[string groupName]() returns json {
        FHIRPathTestCase[] filtered = getAllTestCases().filter(tc => tc.group == groupName);
        TestReport report = runCases(filtered);
        return report.toJson();
    }

    resource function get health() returns json {
        return {"status": "UP", "service": "fhirpath-test-runner"};
    }
}
