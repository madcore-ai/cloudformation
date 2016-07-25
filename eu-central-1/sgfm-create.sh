aws cloudformation create-stack \
    --stack-name DF-FollowMe \
    --template-body file://sgfm.json \
    --parameters file://sgfm-parameters.json 
