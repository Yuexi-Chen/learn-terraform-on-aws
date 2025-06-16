module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  // Upgrade to a version compatible with AWS provider v5.
  version = "~> 5.5"

  name = "devops-project-vpc"
  cidr = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = var.private_subnets_cidr
  public_subnets  = var.public_subnets_cidr

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  // Tags required by EKS for service discovery (e.g., Load Balancers).
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                  = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"         = "1"
  }
}

// Data source to get the available availability zones in the current region.
data "aws_availability_zones" "available" {}