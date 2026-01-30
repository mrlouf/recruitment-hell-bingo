output "ssh_command" {
  value = "ssh -i ~/.ssh/aws-home-lab.pem admin@${aws_eip.cluster_eip.public_ip}"
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.cluster.id
}

output "public_ip" {
  description = "Elastic IP address"
  value       = aws_eip.cluster_eip.public_ip
}

output "private_key_pem" {
  description = "Private SSH key"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}