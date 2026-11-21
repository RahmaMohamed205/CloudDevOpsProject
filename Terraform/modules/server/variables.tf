variable "project_name" {
  description = "Project name used for naming and tagging."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the Jenkins server is deployed."
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet where the Jenkins server is deployed."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type of the Jenkins server."
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair for SSH access."
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to reach the Jenkins server over SSH (port 22)."
  type        = string
  default     = "0.0.0.0/0"
}
