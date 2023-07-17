
output "S3" {
  value       = aws_s3_bucket.terraform_state.bucket
  description = "S3 Bucket Name"
}

