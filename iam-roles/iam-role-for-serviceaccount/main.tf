data "aws_caller_identity" "current" {}

locals {
  oidc_fully_qualified_subjects = format("system:serviceaccount:%s:%s", var.namespace, var.serviceaccount)
  oidc_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${var.oidc_url}"
}

# security/policy
resource "aws_iam_role" "irsa" {
  name  = format("%s", var.name)
  path  = var.path
  tags  = var.tags
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRoleWithWebIdentity"
      Effect = "Allow"
      Principal = {
        Federated = local.oidc_arn
      }
      Condition = {
        StringEquals = {
          format("%s:sub", var.oidc_url) = local.oidc_fully_qualified_subjects
        }
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "irsa" {
  for_each   = var.enabled ? { for key, val in var.policy_arns : key => val } : {}
  policy_arn = each.value
  role       = aws_iam_role.irsa.name
}
