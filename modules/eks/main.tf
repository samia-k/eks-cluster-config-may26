resource "aws_eks_cluster" "main" {
  name = "${var.name_prefix}-cluster"

  access_config {
    authentication_mode = var.authentication_mode
  }

  role_arn = var.eks_cluster_role
  version  = var.eks_version

  vpc_config {
    subnet_ids = var.private_subnet_ids
  }

  depends_on = [aws_iam_role.eks_cluster_role]
}