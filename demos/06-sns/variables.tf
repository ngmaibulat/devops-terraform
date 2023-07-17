variable "aws_region" {

  description = "AWS region to deploy to"
  default     = "eu-central-1"
  type        = string

}

variable "topic_name" {

  description = "SNS Topic Name"
  default     = "news"
  type        = string

}

variable "email" {
  type        = string
  description = "Email to subscribe to the SNS Topic"
}
