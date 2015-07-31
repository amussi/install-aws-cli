# 
# AWS variables
#
export INSTALL_PATH="${HOME}/bin/AWS"

export JAVA_HOME=
export EC2_HOME=${INSTALL_PATH}/ec2
export AWS_IAM_HOME=${INSTALL_PATH}/iam
export AWS_RDS_HOME=${INSTALL_PATH}/rds
export AWS_ELB_HOME=${INSTALL_PATH}/elb
export AWS_CLOUDFORMATION_HOME=${INSTALL_PATH}/cfn
export AWS_AUTO_SCALING_HOME=${INSTALL_PATH}/as
export CS_HOME=${INSTALL_PATH}/cloudsearch
export AWS_CLOUDWATCH_HOME=${INSTALL_PATH}/cloudwatch
export AWS_ELASTICACHE_HOME=${INSTALL_PATH}/elasticache
export AWS_SNS_HOME=${INSTALL_PATH}/sns
export AWS_ROUTE53_HOME=${INSTALL_PATH}/route53
export AWS_CLOUDFRONT_HOME=${INSTALL_PATH}/cloudfront


export AWS_ACCESS_KEY=<your acess key here>
export AWS_SECRET_KEY=<your secret key here>

for BIN_DIR in $(find ${INSTALL_PATH} -type d -name bin)
do
  export PATH=${BIN_DIR}:$PATH
done

PATH=${INSTALL_PATH}/elasticbeanstalk/eb/linux/python2.7:$PATH
PATH=${INSTALL_PATH}/elasticmapreduce:$PATH

export EC2_PRIVATE_KEY=$(echo $HOME/.aws-default/pk-*.pem)
export EC2_CERT=$(echo $HOME/.aws-default/cert-*.pem)
export AWS_CREDENTIAL_FILE=$HOME/.aws-default/aws-credential-file.txt
export ELASTIC_MAPREDUCE_CREDENTIALS=$HOME/.aws-default/aws-credentials.json

# Some tools use AWS_ACCESS_KEY, others use AWS_ACCESS_KEY_ID
export AWS_ACCESS_KEY=< your access key ID >
export AWS_SECRET_KEY=< your secret access key >
export AWS_ACCESS_KEY_ID=< your access key ID >
export AWS_SECRET_SECRET_KEY=< your secret access key >

# Change the default region if desired
#export EC2_REGION=eu-west-1
