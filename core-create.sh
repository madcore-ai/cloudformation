#!/usr/bin/env bash
aws cloudformation create-stack \
    --stack-name MADCORE-Core \
    --template-body file://core.json \
    --parameters file://core-parameters.json \
    --capabilities "CAPABILITY_IAM"
