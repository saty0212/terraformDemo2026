output "public_ip" {
  description = "Public IP of the EC2 instance."
  value       = aws_instance.demo_vm.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance."
  value       = aws_instance.demo_vm.public_dns
}

output "ssh_command" {
  description = "SSH command to connect to the EC2 instance."
  value       = "ssh ec2-user@${aws_instance.demo_vm.public_ip}"
}

output "app_url" {
  description = "URL of the deployed application."
  value       = "http://${aws_instance.demo_vm.public_ip}:${var.app_port}"
}
