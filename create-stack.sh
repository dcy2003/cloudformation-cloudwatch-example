#!/bin/bash

aws cloudformation create-stack \
	--stack-name cfn-cloudwatch-example \
  --template-body file://cloudformation.template \
  --parameters \
    ParameterKey=SshFromIp,ParameterValue=`curl -s http://whatismyip.akamai.com/` \
    ParameterKey=KeyName,ParameterValue=asc-oregon \
    ParameterKey=ExistingVpcId,ParameterValue=vpc-3fcf485b
