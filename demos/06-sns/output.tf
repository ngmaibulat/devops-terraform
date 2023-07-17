
output "sns_id" {
  value       = aws_sns_topic.example.arn
  description = "SNS Topic ARN"
}
