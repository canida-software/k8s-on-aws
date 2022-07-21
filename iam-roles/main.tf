provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}

locals {
  role_path = "/${var.project_name}/"
}

module "irsa-external-dns" {
  source  = "./iam-role-for-serviceaccount"

  namespace      = "external-dns"
  serviceaccount = "external-dns"
  oidc_url       = var.oidc_url
  policy_arns    = [aws_iam_policy.external-dns.id]
  name           = "ExternalDns"
  path           = local.role_path
}

resource "aws_iam_policy" "external-dns" {
  name        = "ExternalDns"
  policy = file("${path.module}/external-dns-policy.json")
}

module "irsa-aws-load-balancer-controller" {
  source  = "./iam-role-for-serviceaccount"

  namespace      = "kube-system"
  serviceaccount = "aws-load-balancer-controller"
  oidc_url       = var.oidc_url
  policy_arns    = [aws_iam_policy.aws-load-balancer-controller.id]
  name           = "AWSLoadBalancerController"
  path           = local.role_path
}

resource "aws_iam_policy" "aws-load-balancer-controller" {
  name        = "AWSLoadBalancerController"
  policy = file("${path.module}/aws-load-balancer-controller-policy.json")
}

module "irsa-external-secrets" {
  source  = "./iam-role-for-serviceaccount"

  namespace      = "external-secrets"
  serviceaccount = "aws-secretsmanager"
  oidc_url       = var.oidc_url
  policy_arns    = [aws_iam_policy.external-secrets.id]
  name           = "ExternalSecrets"
  path           = local.role_path
}

resource "aws_iam_policy" "external-secrets" {
  name        = "ExternalSecrets"
  policy = file("${path.module}/external-secrets-policy.json")
}

