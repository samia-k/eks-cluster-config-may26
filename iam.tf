module "eks_cluster_role" {
  source      = "./modules/iam"
  name_prefix = var.name_prefix
}