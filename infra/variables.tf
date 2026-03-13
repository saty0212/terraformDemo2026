variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name prefix for AWS resources."
  type        = string
  default     = "tf-gh-demo"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "public_key" {
  description = "Public SSH key used to create AWS key pair."
  type        = string
  sensitive   = true
}

variable "app_port" {
  description = "Port used by the Python application."
  type        = number
  default     = 5000
}
