
locals {
  listfile    = "list.txt"
  permissions = "0600"
}


resource "local_file" "demo" {
  content         = var.content
  filename        = "files/${terraform.workspace}-${var.filename}"
  file_permission = local.permissions
}


resource "local_file" "list" {
  content         = "md5: ${local_file.demo.content_md5}\n"
  filename        = "files/${local.listfile}"
  file_permission = local.permissions

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
