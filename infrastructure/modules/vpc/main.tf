
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_vpc" "cloudvpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "cloudvpc"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.cloudvpc.id
}

resource "aws_subnet" "corpsubnet" {
  vpc_id                  = aws_vpc.cloudvpc.id
  cidr_block              = var.vpc_cidr_subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "corpsubnet"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.cloudvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.corpsubnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.cloudvpc.id

  ingress {
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "srv-01" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vmtype
  key_name      = var.key_name
  # security_groups = [aws_security_group.allow_ssh.id]
  subnet_id              = aws_subnet.corpsubnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  depends_on             = [aws_security_group.allow_ssh]

  user_data = file("setup.sh")

  tags = {
    Name = "srv-01"
  }
}
