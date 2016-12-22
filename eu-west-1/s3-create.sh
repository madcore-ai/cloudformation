#!/usr/bin/env bash
aws cloudformation create-stack \
    --stack-name MADCORE-S3 \
    --template-body file://s3.json \
    --parameters file://s3-parameters.json \
    --capabilities "CAPABILITY_IAM"
