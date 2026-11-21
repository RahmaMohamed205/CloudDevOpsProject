variable "project_name" {
  description = "Project name used for naming and tagging."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks of the public subnets (one per availability zone)."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks of the private subnets (one per availability zone)."
  type        = list(string)
}
