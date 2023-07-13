output "public_ip" {
  value       = module.vpc.public_ip
  description = "EC2 VM Public IP"
}

output "privkey" {
  value       = module.key.private_key
  description = "ssh private key"
  sensitive   = true
}
