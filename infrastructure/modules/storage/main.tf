resource "random_pet" "lambda_bucket_name" {
  prefix = "some-prefix"
  length = 4
}

resource "aws_s3_bucket" "hello_bucket" {
  # bucket = "${random_pet.lambda_bucket_name.id}-hello-bucket"
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_sqs_queue" "hello_queue" {
  name = var.queue_name
}
