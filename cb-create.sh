aws cloudformation create-stack \
    --stack-name DevopsFactoryControlBoxSmall \
    --template-body file://cb.json \
    --parameters file://cb-parameters.json 
