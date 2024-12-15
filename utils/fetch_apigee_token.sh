#!/bin/bash

JWT_TOKEN=$(curl -s -X POST 'https://34.8.189.99.nip.io/jwt-generate-token/token' -H 'Content-Type: application/x-www-form-urlencoded' -d 'subject=tutkapaw' -d 'audience=developers' -d 'scope=tutkapaw:read' -d 'custom_claim=example' -H 'apikey: pT9HQ0AeJ70HWHa8N9irAjMOw5W6mAolN0KkSGGhXEVHf5QU' | jq -r '.token')

echo $JWT_TOKEN > jwt_token