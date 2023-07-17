
variable "aws_region" {

  description = "AWS region to deploy to"
  default     = "eu-central-1"
  type        = string

}

variable "bucket_name" {

  description = "Bucket name"
  default     = "ngm-tfstate"
  type        = string

}
