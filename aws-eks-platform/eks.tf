data "aws_caller_identity" "current" {}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  // Use a version compatible with AWS provider v5.
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.28" // v20 of the module supports up to K8s 1.29

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  // Explicitly control cluster endpoint access
  // This ensures kubectl on your local machine can connect to the cluster
  cluster_endpoint_public_access = true

  // Grant admin access to the IAM user/role running Terraform.
  // This is the simplest way to replace the deprecated `aws_auth_users`.
  enable_cluster_creator_admin_permissions = true

  // Define the EKS managed node group for our workloads.
  eks_managed_node_groups = {
    devops_nodes = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.small"] // Cost-effective instance type for a demo project.
      capacity_type  = "ON_DEMAND"
    }
  }
}