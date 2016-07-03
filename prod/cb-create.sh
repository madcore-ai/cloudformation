aws cloudformation create-stack \
    --stack-name DF-ControlBoxSmall \
    --template-body file://cb.json \
    --parameters file://cb-parameters.json \
    --capabilities "CAPABILITY_IAM"
