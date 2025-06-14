output "key_name" {
  description = "Name of the AWS key pair"
  value       = aws_key_pair.this.key_name
}

output "key_pair_id" {
  description = "AWS-generated ID of the key pair"
  value       = aws_key_pair.this.key_pair_id
}