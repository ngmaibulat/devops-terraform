### Sample

```terraform

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c574c8"
  instance_type = "t2.micro"

  key_name = "your_key_name"

  provisioner "file" {
    source      = "conf/myapp.conf"
    destination = "/etc/myapp.conf"

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /etc/myapp.conf",
      "service myapp start",
    ]

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
}
```
