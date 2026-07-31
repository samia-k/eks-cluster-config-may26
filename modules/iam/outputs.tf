output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "eks_cluster_role_name" {
  value = aws_iam_role.eks_cluster_role.name
}

output "eks_policy_attachment" {
  value = aws_iam_role.eks_policy_attachment.arn
}
