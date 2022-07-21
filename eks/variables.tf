# -----------------------------------------------------------------------------
# AWS
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "default_tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID to deploy Hasura and database in."
  type = string
}

variable "private_subnets" {
  description = "Private subnets in vpc to deploy Hasura's database in."
  type = list(string)
}

# -----------------------------------------------------------------------------
# Kubernetes
# -----------------------------------------------------------------------------

variable "kubernetes_version" {
  description = "The target version of kubernetes."
  type        = string
  default     = "1.22"
}


variable "cluster_name" {
  description = "The logical name of the eks instantiation."
  type        = string
  default     = "eks"
}

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node group definitions to create."
  type        = any
}

