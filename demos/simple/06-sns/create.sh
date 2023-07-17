#!/bin/bash

set -e

export AWS_PAGER=""

aws sns create-topic --name news

#arn:aws:sns:eu-central-1:403185480682:news

export TOPIC_ARN=$(aws sns list-topics | jq -r '.Topics[] | select(.TopicArn | contains("news")) | .TopicArn')
export EMAIL=viyino3950@niback.com

aws sns list-topics

aws sns subscribe --topic-arn $TOPIC_ARN --protocol email --notification-endpoint $EMAIL

aws sns publish --topic-arn $TOPIC_ARN  --message "Hello from SNS" --subject "Test Message"
