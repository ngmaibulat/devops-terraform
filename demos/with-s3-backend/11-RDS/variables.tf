
variable "aws_region" {

  description = "AWS region to deploy to"
  default     = "eu-central-1"
  type        = string

}


variable "db_pass" {

  description = "DB Password"
  type        = string

}
