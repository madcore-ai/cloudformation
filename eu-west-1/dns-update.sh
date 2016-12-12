#!/usr/bin/env bash
aws cloudformation update-stack \
    --stack-name MADCORE-DNS \
    --template-body file://dns.json \
    --parameters file://dns-parameters.json

