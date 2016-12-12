#!/usr/bin/env bash
aws cloudformation create-stack \
    --stack-name MADCORE-FollowMe \
    --template-body file://sgfm.json \
    --parameters file://sgfm-parameters.json 
