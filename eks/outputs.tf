################################################################################
# General
################################################################################

output "aws_region" {
  description = "AWS region"
  value       = var.aws_region
}

################################################################################
# Cluster
################################################################################

output "cluster_id" {
  description = "Cluster identifier/name"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_oidc_provider" {
  description = "Cluster oidc provider"
  value       = {
    provider = module.eks.oidc_provider
    provider_arn = module.eks.oidc_provider_arn
  }
}


################################################################################
# CloudWatch Log Group
################################################################################

output "cloudwatch_log_group" {
  description = "Cloudwatch log group created"
  value       = {
    name = module.eks.cloudwatch_log_group_name
    arn = module.eks.cloudwatch_log_group_arn
  }
}

