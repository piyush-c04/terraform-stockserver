output "poller_arn" {
  description = "Poller Lambda ARN"
  value       = aws_lambda_function.poller.arn
}

output "transformer_arn" {
  description = "Transformer Lambda ARN"
  value       = aws_lambda_function.transformer.arn
}

output "transformer_role_arn" {
  description = "Transformer Lambda execution role ARN"
  value       = aws_iam_role.transformer.arn
}