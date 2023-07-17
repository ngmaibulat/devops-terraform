
export SNS_ARN=`terraform output -raw sns_id`

aws sns publish --topic-arn $SNS_ARN  --message "Hello from SNS" --subject "Test Message"
