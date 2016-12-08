#!/usr/bin/env bash
aws cloudformation update-stack \
    --stack-name Madcore-DNS \
    --template-body file://dns.json \
    --parameters file://dns-parameters.json

