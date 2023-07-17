
# aws sqs get-queue-url --queue-name news

export URL=`terraform output -raw sqs_url`

export MSG="Hello from SQS"

aws sqs send-message --queue-url $URL --message-body $MSG
