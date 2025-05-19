#!/bin/bash
awd --version 2> /dev/null
if [ $? -eq 0 ]; then
    REGION=$1
    aws ec2 describe-vpcs --region "$REGION" | jq -r '.Vpcs[].VpcId'
else
    echo "Incorrect command"
fi


