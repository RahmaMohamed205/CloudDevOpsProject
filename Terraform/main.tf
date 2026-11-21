# =============================================================================
# Root module - wires together the network, server (Jenkins EC2), EKS and ECR
# modules.
# =============================================================================

module "network" {
  source = "./modules/network"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "server" {
  source = "./modules/server"

  project_name     = var.project_name
  environment      = var.environment
  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_ids[0]
  instance_type    = var.jenkins_instance_type
  key_name         = var.jenkins_key_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "eks" {
  source = "./modules/eks"

  project_name        = var.project_name
  environment         = var.environment
  cluster_version     = var.eks_cluster_version
  private_subnet_ids  = module.network.private_subnet_ids
  node_instance_types = var.eks_node_instance_types
}

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
  environment  = var.environment
  repositories = ["frontend", "auth-service", "roadmap-service"]
}
