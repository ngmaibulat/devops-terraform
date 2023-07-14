```h
resource "local_file" "demo" {
  content         = var.content
  filename        = var.filename
  file_permission = "0600"
}
```
