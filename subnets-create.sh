aws cloudformation create-stack \
    --stack-name DevopsfactorySubnets \
    --template-body file://subnets.json \
    --parameters file://subnets-parameters.json 
