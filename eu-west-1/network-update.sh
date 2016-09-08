aws cloudformation update-stack \
    --stack-name DF-Net \
    --template-body file://network.json \
    --parameters file://network-parameters.json 
