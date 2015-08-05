#! /bin/bash
# 
MY_EXTERNAL_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"

[[ -z ${MY_EXTERNAL_IP} ]] && exit 1  

aws ec2 authorize-security-group-ingress --group-name sshConnectFromDesktop --protocol tcp --port 22 --cidr ${MY_EXTERNAL_IP}/32 
