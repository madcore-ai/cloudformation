#!/usr/bin/env bash
aws cloudformation create-stack \
    --stack-name Madcore-DNS \
    --template-body file://dns.json \
    --parameters file://dns-parameters.json
