
variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "eu-west-1" // Ireland region, aligning with job posting location.
}

variable "cluster_name" {
  description = "The unique name for the EKS cluster."
  type        = string
  default     = "devops-project-cluster"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidr" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository to store Docker images."
  type        = string
  default     = "devops-project-repo"
}