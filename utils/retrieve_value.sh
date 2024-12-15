#!/bin/bash

TOKEN=$(gcloud auth print-access-token)
ORG=new-apigee-org-87654
ENV=test-env
KVM=privateKeyJwt

curl -H "Authorization: Bearer $TOKEN" "https://apigee.googleapis.com/v1/organizations/$ORG/environments/$ENV/keyvaluemaps/$KVM/entries/public_key"
