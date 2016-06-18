aws cloudformation create-stack \
    --stack-name devopsfactory-followme \
    --template-body file://sgfm.json \
    --parameters file://sgfm-parameters.json 
