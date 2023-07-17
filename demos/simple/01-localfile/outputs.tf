output "md5" {
  value       = local_file.demo.content_md5
  description = "MD5 Hash of the file"
}

# "random_integer" "random"

output "random" {
  value       = random_integer.random.result
  description = "Random number"
}
