#! /bin/bash
#
# This will install EC2 cli in your home directory or upgrade if already exist.
# Author : Alban MUSSI - 31/07/2015 
# 
# Warning : This install old version of ec2 tools.
#           You should use the newer version of aws cli.
#           
#
INSTALL_PATH="$HOME/bin/AWS" 
ARCHIVE_NAME="ec2-api-tools.zip" 
URL="http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip"

[[ -f ${INSTALL_PATH}/$ARCHIVE_NAME ]] && rm ${INSTALL_PATH}/${ARCHIVE_NAME} 
[[ -d ${INSTALL_PATH} ]] || mkdir -p ${INSTALL_PATH} 

printf "Downloading ${ARCHIVE_NAME} in ${INSTALL_PATH}. Be patient.... \n"   
wget -q -O ${INSTALL_PATH}/${ARCHIVE_NAME}  ${URL} 

if [[ $? -eq 0 ]] ; then 
    printf "Downloading ${ARCHIVE_NAME} sucessfull !  \n"   
    DIRECTORY_NAME="$(basename $(unzip -l ${INSTALL_PATH}/${ARCHIVE_NAME} |awk '/^\s*[0-9]/ {print $(NF)}' |head -1))" 
    if [[ -d ${INSTALL_PATH}/${DIRECTORY_NAME} ]] ; then
        printf "Directory ${INSTALL_PATH}/${DIRECTORY_NAME} already exist.\nWe assume that ec2 version is up to date  !\n" 
        exit 1  
    else
        (cd ${INSTALL_PATH} && unzip -q ec2-api-tools.zip)
        if [[ -L ${INSTALL_PATH}/ec2 ]] ; then 
            rm ${INSTALL_PATH}/ec2
        fi
        ln -s ${INSTALL_PATH}/${DIRECTORY_NAME}  ${INSTALL_PATH}/ec2
        printf "Installation of ec2 in ${INSTALL_PATH}/ec2 sucessfull \n" 
        printf "export PATH=\$PATH:${INSTALL_PATH}/bini\n" 
        exit 0 
    fi 
fi 
