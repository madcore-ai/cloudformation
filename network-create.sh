aws cloudformation create-stack \
    --stack-name DevopsFactoryNetworkBasic001 \
    --template-body file://network.json \
    --parameters file://network-parameters.json 
