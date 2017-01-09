#!/usr/bin/env bash
aws cloudformation create-stack \
    --stack-name MADCORE-Net \
    --template-body file://network.json \
    --parameters file://network-parameters.json 
