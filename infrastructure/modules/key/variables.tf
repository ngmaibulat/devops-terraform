variable "algorithm" {
  description = "Key algorithm"
  type        = string
  default     = "RSA"
}

variable "bits" {
  description = "Key Length"
  type        = number
  default     = 4096
}

variable "name" {
  description = "Key name"
  type        = string
  default     = "sshkey"
}
