variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_cidr_subnet" {
  description = "CIDR add for the subnet"
  type        = string
}

variable "key_name" {
  description = "Key name"
  type        = string
  default     = "ssh-key"
}

variable "vmtype" {
  description = "VM type"
  type        = string
  default     = "t2.nano"
}
