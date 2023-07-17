
output "sqs_arn" {
  value       = aws_sqs_queue.example.arn
  description = "SQS ARN"
}


output "sqs_url" {
  value       = aws_sqs_queue.example.url
  description = "SQS URL"
}
