output "arn" {
  description = "Kinesis stream ARN"
  value       = aws_kinesis_stream.this.arn
}

output "name" {
  description = "Stream name"
  value       = aws_kinesis_stream.this.name
}

output "producer_policy_arn" {
  description = "IAM policy ARN for producers"
  value       = aws_iam_policy.producer_access.arn
}