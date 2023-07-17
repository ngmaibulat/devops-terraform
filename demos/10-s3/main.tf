
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
}


resource "aws_s3_bucket_ownership_controls" "controls" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_acl" "acl" {
  depends_on = [aws_s3_bucket_ownership_controls.controls]

  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
