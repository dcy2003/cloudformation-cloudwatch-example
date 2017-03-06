# Example: CloudFormation + CloudWatch Logs + CloudWatch Custom metrics

Spins up an EC2 instance via CloudFormation and demonstrates how to do the following during the bootstrap process:

* Configure Python daemon that automatically pushes various log files to CloudWatch
* Configure cron script to push custom metrics (memory, swap, etc.) to CloudWatch

## Prerequisites:

* AWS account
* [AWS CLI](https://aws.amazon.com/cli/)
* IAM user with sufficient privileges + access key
* Run `aws configure` to set the desired region, access key, secret access key
* An existing VPC, public subnet, key pair, and security group that allows SSH access in the desired AWS region

## To Run:

* Edit `create-stack.sh` as necessary:
 * `KeyName` the name of the key pair in the desired AWS region
 * `ExistingSecurityGroupId` is the ID of an existing security group (e.g. sg-xxxxxxxx)
 * See `cloudformation.template` for complete list of parameters
* Run `./create-stack.sh` to provison and configure all resources.

## Cleanup:

* When finished, run `./delete-stack.sh` to tear down all resources.

## Notes:

* The current region-to-AMI-mapping defined in `cloudformation.template` only specifies an AMI for `us-west-2` (Oregon region)
 * The default AMI is CentOS7
 * It should be trivial to modify this mapping to add support for additional regions if necessary

## Helpful Links / References:
* https://aws.amazon.com/blogs/devops/view-cloudformation-logs-in-the-console/
* http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-helper-scripts-reference.html
* http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-init.html
* http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/EC2NewInstanceCWL.html
* http://www.danieleyer.com/blog/2016/07/15/adding-aws-cfn-bootstrap-cloudformation-helper-scripts-to-custom-linux-amis/
* http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html
