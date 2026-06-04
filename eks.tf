# module "aws_eks_cluster" {
#   source = "./modules/eks"
#   name_prefix = var.name_prefix
#   eks_version = var.eks_version
#   authentication_mode = var.authentication_mode
#   subnet_ids = var.subnet_ids
#   eks_policy_attachment = var.eks_policy_attachment //change to reference iam module output
# }