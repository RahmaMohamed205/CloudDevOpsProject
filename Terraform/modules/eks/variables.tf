variable "project_name" {
  description = "Project name used for naming and tagging."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version of the EKS cluster."
  type        = string
  default     = "1.30"
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets where the worker nodes run. Must span at least two availability zones."
  type        = list(string)
}

variable "node_instance_types" {
  description = "Instance types of the worker nodes."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  description = "Desired number of worker nodes (two, spread across the private subnets/AZs)."
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 3
}
