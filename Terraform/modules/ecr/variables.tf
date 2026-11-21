variable "project_name" {
  description = "Project name used for naming and tagging."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "repositories" {
  description = "Names of the ECR repositories to create, one per microservice."
  type        = list(string)
  default     = ["frontend", "auth-service", "roadmap-service"]
}
