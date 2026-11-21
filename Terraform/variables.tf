variable "project_name" {
  description = "Project name used for naming and tagging all resources."
  type        = string
  default     = "ivolve"
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region where all resources are provisioned."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block of the main VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks of the public subnets (one per availability zone)."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks of the private subnets (one per availability zone)."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "jenkins_instance_type" {
  description = "EC2 instance type of the Jenkins server."
  type        = string
  default     = "t3.medium"
}

variable "jenkins_key_name" {
  description = "Name of an existing EC2 key pair for SSH access to the Jenkins server."
  type        = string
  default     = "ivolve-jenkins-key"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the Jenkins server. Restrict this to your own IP in real deployments."
  type        = string
  default     = "0.0.0.0/0"
}

variable "eks_cluster_version" {
  description = "Kubernetes version of the EKS cluster."
  type        = string
  default     = "1.30"
}

variable "eks_node_instance_types" {
  description = "Instance types of the EKS worker nodes."
  type        = list(string)
  default     = ["t3.medium"]
}
