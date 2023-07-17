variable "aws_region" {

  description = "AWS region to deploy to"
  default     = "eu-central-1"
  type        = string

}

variable "queue_name" {

  description = "SQS Queue Name"
  default     = "queue1"
  type        = string

}
