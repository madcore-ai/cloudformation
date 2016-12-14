#!/usr/bin/env bash
aws cloudformation update-stack \
    --stack-name MADCORE-Dns \
    --template-body file://dns.json \
    --parameters file://dns-parameters.json

