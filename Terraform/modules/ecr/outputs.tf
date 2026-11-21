output "repository_urls" {
  description = "URLs of the ECR repositories, keyed by service name."
  value       = { for name, repo in aws_ecr_repository.services : name => repo.repository_url }
}

output "repository_arns" {
  description = "ARNs of the ECR repositories, keyed by service name."
  value       = { for name, repo in aws_ecr_repository.services : name => repo.arn }
}
