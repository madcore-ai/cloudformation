#!/usr/bin/env bash
aws cloudformation update-stack \
    --stack-name MADCORE-Cluster \
    --template-body file://cluster.json \
    --parameters file://cluster-parameters.json

