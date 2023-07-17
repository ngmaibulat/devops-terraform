resource "local_file" "demo" {
  content         = var.content
  filename        = var.filename
  file_permission = "0600"
}


resource "local_file" "list" {
  content         = "md5: ${local_file.demo.content_md5}\n"
  filename        = "list.txt"
  file_permission = "0600"

  depends_on = [local_file.demo]

  lifecycle {
    create_before_destroy = true
    # prevent_destroy = true
    # ignore_changes = [tags]
  }
}

resource "random_integer" "random" {
  min = 1000
  max = 9999
}
