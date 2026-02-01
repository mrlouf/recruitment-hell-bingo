provider "aws" {
  region = "eu-west-3"
}

module "cluster" {
  source = "./module/"

  vpc_id              = "vpc-0c73afefcb9683ebd"
  subnet_id           = "subnet-0546fd4a2df0c1115"
  instance_type       = "t3.micro"
  instance_name       = "bingo-hell"
  security_group_name = "bingo-hell_sg"
  ssh_cidr_blocks     = ["0.0.0.0/0"]

}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.cluster.instance_id
}

output "public_ip" {
  description = "Elastic IP address"
  value       = module.cluster.public_ip
}

output "private_key_pem" {
  description = "Private SSH key"
  value       = module.cluster.private_key_pem
  sensitive   = true
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ~/.ssh/bingo-hell-key.pem admin@${module.cluster.public_ip}"
}