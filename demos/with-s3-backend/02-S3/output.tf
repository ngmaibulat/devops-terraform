
output "S3" {
  value       = aws_s3_bucket.demo_bucket.bucket
  description = "S3 Bucket Name"
}

