module "eks_cluster" {
  source                = "./modules/eks"
  name_prefix           = var.name_prefix
  eks_version           = var.eks_version
  authentication_mode   = var.authentication_mode
  private_subnet_ids    = module.vpc.private_subnet_ids
  eks_cluster_role      = module.eks_cluster_role.eks_cluster_role_arn
  eks_policy_attachment = module.eks_cluster_role.eks_policy_attachment
}