aws cloudformation create-stack \
    --stack-name DevopsfactoryNetwork \
    --template-body file://network.json \
    --parameters file://network-parameters.json 
