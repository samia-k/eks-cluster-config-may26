//need to create an eks cluster with 3 nodes
//asg template and iam roles
//then work to integrate gitops practices


resource "aws_eks_cluster" "main" {
  name = "${var.name_prefix}-cluster"

  access_config {
    authentication_mode = var.authentication_mode
  }

  role_arn = aws_iam_role.cluster.arn
  version  = var.eks_version

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = var.eks_policy_attachment
}