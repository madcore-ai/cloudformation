#!/usr/bin/env bash
aws cloudformation update-stack \
    --stack-name MADCORE-Net \
    --template-body file://network.json \
    --parameters file://network-parameters.json 
