output "vpc_id" {
  description = "ID of the main VPC."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value       = module.network.private_subnet_ids
}

output "jenkins_public_ip" {
  description = "Public IP address of the Jenkins EC2 instance."
  value       = module.server.jenkins_public_ip
}

output "jenkins_url" {
  description = "URL of the Jenkins web console."
  value       = module.server.jenkins_url
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "API server endpoint of the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "ecr_repository_urls" {
  description = "URLs of the ECR repositories, keyed by repository name."
  value       = module.ecr.repository_urls
}
