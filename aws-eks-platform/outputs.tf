
output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster's API server."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "The primary security group ID for the EKS cluster."
  value       = module.eks.cluster_security_group_id
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository."
  value       = aws_ecr_repository.app_repo.repository_url
}

output "region" {
  description = "The AWS region where the resources are deployed."
  value       = var.aws_region
}

output "cluster_name" {
  description = "The name of the created EKS cluster."
  value       = var.cluster_name
}
