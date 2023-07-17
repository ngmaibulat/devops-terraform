
resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.bucket_name
}


resource "aws_s3_bucket_ownership_controls" "controls" {
  bucket = aws_s3_bucket.demo_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_acl" "acl" {
  depends_on = [aws_s3_bucket_ownership_controls.controls]

  bucket = aws_s3_bucket.demo_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.demo_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
