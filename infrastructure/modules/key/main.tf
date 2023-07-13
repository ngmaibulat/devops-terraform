
resource "tls_private_key" "privkey" {
  algorithm = var.algorithm
  rsa_bits  = var.bits
}

resource "aws_key_pair" "sshkey" {
  key_name   = var.name
  public_key = tls_private_key.privkey.public_key_openssh
}
