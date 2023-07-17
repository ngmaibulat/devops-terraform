
export URL=`terraform output -raw sqs_url`

aws sqs receive-message --queue-url $URL

