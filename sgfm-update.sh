aws cloudformation update-stack \
    --stack-name devopsfactory-followme \
    --template-body file://sgfm.json \
    --parameters file://sgfm-parameters.json 
