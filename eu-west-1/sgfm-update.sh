#!/usr/bin/env bash
aws cloudformation update-stack \
    --stack-name MADCORE-FollowMe \
    --template-body file://sgfm.json \
    --parameters file://sgfm-parameters.json 

