
variable "aws_region" {

  description = "AWS region to deploy to"
  default     = "eu-central-1"
  type        = string

}

variable "user_name" {

  description = "username"
  default     = "s3_user"
  type        = string

}

variable "policy_name" {

  description = "policy name"
  default     = "s3_policy"
  type        = string

}
