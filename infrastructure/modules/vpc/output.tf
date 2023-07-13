output "public_ip" {
  value       = aws_instance.srv-01.public_ip
  description = "EC2 VM Public IP"
}
