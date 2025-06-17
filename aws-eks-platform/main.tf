terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      // TEMPORARY: Use a newer provider ONLY to allow destruction of the corrupt state.
      // We will change this back to 4.67.0 after the destroy command.
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0"
}

// Configure the AWS Provider.
// It will use credentials configured via `aws configure` in Phase 1.
provider "aws" {
  region = var.aws_region
}

