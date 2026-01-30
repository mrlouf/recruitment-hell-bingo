variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "m7i-flex.large"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "bingo-hell-key"
}

variable "private_key_path" {
  description = "Path to store the private key"
  type        = string
  default     = "~/.ssh/bingo-hell.pem"
}

variable "security_group_name" {
  description = "Name for the security group"
  type        = string
  default     = "bingo-hell_sg"
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}