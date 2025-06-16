
resource "aws_ecr_repository" "app_repo" {
  name                 = var.ecr_repository_name
  image_tag_mutability = "MUTABLE" // Allows image tags to be overwritten, suitable for CI/CD.

  image_scanning_configuration {
    scan_on_push = true // Automatically scan images for vulnerabilities upon push.
  }
}
