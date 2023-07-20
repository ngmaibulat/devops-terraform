
output "db" {
  value = aws_db_instance.default.address
}

output "user" {
  value = aws_db_instance.default.username
}
