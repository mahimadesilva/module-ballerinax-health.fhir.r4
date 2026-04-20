Ballerina package containing FHIR resource data models
compliant with https://profiles.ihe.net/ITI/PDQm/ implementation guide.

# FHIR R4 ihe_pdqm package

## Package Overview

|                      |                      |
|----------------------|----------------------|
| FHIR version         | R4                   |
| Implementation Guide | https://profiles.ihe.net/ITI/PDQm/               |


**Note:**
**This package only supports FHIR JSON payload format only. FHIR XML payload support will be added soon.**

## Capabilities and features

### Supported FHIR resource types

|                  |                                             |
|------------------|---------------------------------------------|
| 1). AuditPdqmQuerySupplier | [[Definition]][s1] [[Ballerina Record]][m1] |
| 2). MatchParametersIn | [[Definition]][s2] [[Ballerina Record]][m2] |
| 3). PDQmPatient | [[Definition]][s3] [[Ballerina Record]][m3] |
| 4). AuditPdqmQueryConsumer | [[Definition]][s4] [[Ballerina Record]][m4] |
| 5). AuditPdqmMatchConsumer | [[Definition]][s5] [[Ballerina Record]][m5] |
| 6). AuditPdqmMatchSupplier | [[Definition]][s6] [[Ballerina Record]][m6] |
| 7). PDQmMatchInput | [[Definition]][s7] [[Ballerina Record]][m7] |

[m1]: https://lib.ballerina.io/healthcare_samples/ihe_pdqm/1.0.0#AuditPdqmQuerySupplier
[m2]: https://lib.ballerina.io/healthcare_samples/ihe_pdqm/1.0.0#MatchParametersIn
[m3]: https://lib.ballerina.io/healthcare_samples/ihe_pdqm/1.0.0#PDQmPatient
[m4]: https://lib.ballerina.io/healthcare_samples/ihe_pdqm/1.0.0#AuditPdqmQueryConsumer
[m5]: https://lib.ballerina.io/healthcare_samples/ihe_pdqm/1.0.0#AuditPdqmMatchConsumer
[m6]: https://lib.ballerina.io/healthcare_samples/ihe_pdqm/1.0.0#AuditPdqmMatchSupplier
[m7]: https://lib.ballerina.io/healthcare_samples/ihe_pdqm/1.0.0#PDQmMatchInput

[s1]: https://profiles.ihe.net/ITI/PDQm/StructureDefinition/IHE.PDQm.Query.Audit.Supplier
[s2]: https://profiles.ihe.net/ITI/PDQm/StructureDefinition/IHE.PDQm.MatchParametersIn
[s3]: https://profiles.ihe.net/ITI/PDQm/StructureDefinition/IHE.PDQm.Patient
[s4]: https://profiles.ihe.net/ITI/PDQm/StructureDefinition/IHE.PDQm.Query.Audit.Consumer
[s5]: https://profiles.ihe.net/ITI/PDQm/StructureDefinition/IHE.PDQm.Match.Audit.Consumer
[s6]: https://profiles.ihe.net/ITI/PDQm/StructureDefinition/IHE.PDQm.Match.Audit.Supplier
[s7]: https://profiles.ihe.net/ITI/PDQm/StructureDefinition/IHE.PDQm.MatchInputPatient
