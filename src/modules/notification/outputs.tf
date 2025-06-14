# Broker API SNS Outputs
output "broker_sns_topic_arn" {
  description = "ARN of the broker API events SNS topic"
  value       = aws_sns_topic.broker_api_events.arn
}

output "broker_sms_subscriptions" {
  description = "List of broker SMS subscription ARNs"
  value       = [for sub in aws_sns_topic_subscription.broker_sms_alerts : sub.arn]
}

# CloudWatch SNS Outputs
output "cloudwatch_sns_topic_arn" {
  description = "ARN of the CloudWatch alerts SNS topic"
  value       = aws_sns_topic.cloudwatch_alerts.arn
}

output "critical_alert_subscriptions" {
  description = "List of critical SMS subscription ARNs"
  value       = [for sub in aws_sns_topic_subscription.cloudwatch_sms : sub.arn]
}

# Lambda Outputs
output "lambda_processor_name" {
  description = "Name of the broker API processor Lambda function"
  value       = aws_lambda_function.api_processor.function_name
}

output "lambda_processor_arn" {
  description = "ARN of the broker API processor Lambda"
  value       = aws_lambda_function.api_processor.arn
}

# IAM Outputs
output "sns_publish_policy_arn" {
  description = "ARN of the IAM policy allowing SNS publishing"
  value       = aws_iam_role_policy_attachment.lambda_sns_publish.policy_arn
}

output "sqs_queue_url" {
  description = "URL of the broker events SQS queue"
  value       = aws_sqs_queue.broker_events.url
}

output "sqs_queue_arn" {
  description = "ARN of the broker events SQS queue"
  value       = aws_sqs_queue.broker_events.arn
}

output "dlq_arn" {
  description = "ARN of the dead-letter queue"
  value       = aws_sqs_queue.dlq.arn
}