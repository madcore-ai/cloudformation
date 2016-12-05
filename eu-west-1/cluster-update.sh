#!/usr/bin/env bash
aws cloudformation update-stack \
    --stack-name Madcore-Cluster \
    --template-body file://cluster.json \
    --parameters file://cluster-parameters.json

