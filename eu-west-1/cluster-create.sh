#!/usr/bin/env bash
aws cloudformation create-stack \
    --stack-name MADCORE-Cluster \
    --template-body file://cluster.json \
    --parameters file://cluster-parameters.json \
    --capabilities "CAPABILITY_IAM"
