#!/bin/bash

aws cloudformation create-stack \
	--stack-name cfn-cloudwatch-example \
  --template-body file://cloudformation.template \
  --parameters \
    ParameterKey=KeyName,ParameterValue=asc-oregon \
    ParameterKey=ExistingSecurityGroupId,ParameterValue=sg-960427ee \
  --capabilities CAPABILITY_NAMED_IAM
