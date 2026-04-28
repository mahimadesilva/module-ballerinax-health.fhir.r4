function getCodesystemResource() returns json {
    return {
    "CodeSystem": {
        "id": {
            "_value": "example"
        },
        "meta": {
            "profile": {
                "_value": "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
            }
        },
        "url": {
            "_value": "http://hl7.org/fhir/CodeSystem/example"
        },
        "identifier": {
            "system": {
                "_value": "http://acme.com/identifiers/codesystems"
            },
            "value": {
                "_value": "internal-cholesterol-inl"
            }
        },
        "version": {
            "_value": "20160128"
        },
        "name": {
            "_value": "ACMECholCodesBlood"
        },
        "title": {
            "_value": "ACME Codes for Cholesterol in Serum/Plasma"
        },
        "status": {
            "_value": "draft"
        },
        "experimental": {
            "_value": "true"
        },
        "date": {
            "_value": "2016-01-28"
        },
        "publisher": {
            "_value": "Acme Co"
        },
        "contact": {
            "name": {
                "_value": "FHIR project team"
            },
            "telecom": {
                "system": {
                    "_value": "url"
                },
                "value": {
                    "_value": "http://hl7.org/fhir"
                }
            }
        },
        "description": {
            "_value": "This is an example code system that includes all the ACME codes for serum/plasma cholesterol    from v2.36."
        },
        "caseSensitive": {
            "_value": "true"
        },
        "content": {
            "_value": "complete"
        },
        "filter": {
            "code": {
                "_value": "acme-plasma"
            },
            "description": {
                "_value": "An internal filter used to select codes that are only used with plasma"
            },
            "operator": {
                "_value": "="
            },
            "value": {
                "_value": "the value of this filter is either 'true' or 'false'"
            }
        },
        "concept": [
            {
                "code": {
                    "_value": "chol-mass"
                },
                "display": {
                    "_value": "SChol (mmol/L)"
                },
                "definition": {
                    "_value": "Serum Cholesterol, in mmol/L"
                },
                "designation": {
                    "use": {
                        "system": {
                            "_value": "http://acme.com/config/fhir/codesystems/internal"
                        },
                        "code": {
                            "_value": "internal-label"
                        }
                    },
                    "value": {
                        "_value": "From ACME POC Testing"
                    }
                }
            },
            {
                "code": {
                    "_value": "chol-mass"
                },
                "display": {
                    "_value": "SChol (mg/L)"
                },
                "definition": {
                    "_value": "Serum Cholesterol, in mg/L"
                },
                "designation": {
                    "use": {
                        "system": {
                            "_value": "http://acme.com/config/fhir/codesystems/internal"
                        },
                        "code": {
                            "_value": "internal-label"
                        }
                    },
                    "value": {
                        "_value": "From Paragon Labs"
                    }
                }
            },
            {
                "code": {
                    "_value": "chol"
                },
                "display": {
                    "_value": "SChol"
                },
                "definition": {
                    "_value": "Serum Cholesterol"
                },
                "designation": {
                    "use": {
                        "system": {
                            "_value": "http://acme.com/config/fhir/codesystems/internal"
                        },
                        "code": {
                            "_value": "internal-label"
                        }
                    },
                    "value": {
                        "_value": "Obdurate Labs uses this with both kinds of units..."
                    }
                }
            }
        ],
        "_xmlns": "http://hl7.org/fhir"
    }
};
}
