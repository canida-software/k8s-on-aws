output "external-dns" {
  value = module.irsa-external-dns
}
output "aws-load-balancer-controller" {
  value = module.irsa-aws-load-balancer-controller
}

output "external-secrets" {
  value = module.irsa-external-secrets
}