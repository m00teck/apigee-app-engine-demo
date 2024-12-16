#!/bin/bash

QUERYPARAM=KLEOFAS

curl -X POST "https://34.8.189.99.nip.io/jwt-verify-proxy/user?user=$QUERYPARAM" -H "Authorization: Bearer $(cat jwt_token)"

echo ""