output "name" {
  value       = aws_iam_role.irsa.name
  description = "The name of generated IAM role"
}

output "arn" {
  value       = aws_iam_role.irsa.arn
  description = "The ARN of generated IAM role"
}