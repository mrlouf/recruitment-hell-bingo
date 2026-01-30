data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-13-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["136693071363"]
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bingo-hell" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = pathexpand(var.private_key_path)
  file_permission = "0400"
}

resource "aws_eip" "cluster_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "cluster_eip_association" {
  instance_id   = aws_instance.cluster.id
  allocation_id = aws_eip.cluster_eip.id
}

resource "aws_security_group" "cluster_sg" {
  name        = var.security_group_name
  description = "Allow HTTP, HTTPS, and SSH"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "cluster" {
  ami                    = data.aws_ami.debian.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.cluster_sg.id]
  key_name               = aws_key_pair.bingo-hell.key_name
  subnet_id              = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}