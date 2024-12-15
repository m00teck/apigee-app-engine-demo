#!/bin/bash

TOKEN=$(gcloud auth print-access-token)
ORG=new-apigee-org-87654
ENV=test-env
KVM=privateKeyJwt
KVM_ENTRY=public_key
KVM_VALUE=$(cat public_key.pem)

curl -X POST -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d "{\"name\": \"$KVM_ENTRY\",\"value\": \"$KVM_VALUE\"}" "https://apigee.googleapis.com/v1/organizations/$ORG/environments/$ENV/keyvaluemaps/$KVM/entries"
