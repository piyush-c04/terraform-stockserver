# S3 Outputs
output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.data_store.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.data_store.arn
}

output "s3_bucket_region" {
  description = "Region of the S3 bucket"
  value       = aws_s3_bucket.data_store.region
}

output "s3_id" {
  description = "Shows the id of the bucket created"
  value = aws_s3_bucket.data_store.s3_id
}

output "bucket_regional_domain_name" {
  description = "Bucket region-specific domain name"
  value       = aws_s3_bucket.historical_stock_data_storage.bucket_regional_domain_name
}