
variable "aws_region" {

  description = "AWS region to deploy to"
  default     = "eu-central-1"
  type        = string

}

variable "key_name" {

  description = "Name of the SSH key to use"
  default     = "ssh-key"
  type        = string

}
