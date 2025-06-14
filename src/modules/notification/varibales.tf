# Broker API SNS Topic
variable "broker_sns_topic_name" {
  description = "Name for the SNS topic receiving processed broker API events"
  type        = string
  default     = "broker-api-events"
}

variable "broker_sms_subscribers" {
  description = "List of phone numbers (E.164 format) for broker API SMS alerts"
  type        = list(string)
  default     = ["+15551234567"] # Replace with actual numbers
}

variable "broker_email_subscribers" {
  description = "List of email addresses for broker API email alerts"
  type        = list(string)
  default     = ["alerts@yourdomain.com"]
}

# CloudWatch Alarms SNS Topic
variable "cloudwatch_sns_topic_name" {
  description = "Name for the CloudWatch alerts SNS topic"
  type        = string
  default     = "cloudwatch-alerts"
}

variable "critical_sms_subscribers" {
  description = "List of phone numbers for critical infrastructure alerts"
  type        = list(string)
  default     = ["+15557654321"] # Ops team numbers
}

variable "alert_severity_levels" {
  description = "Severity levels to filter SMS alerts"
  type        = list(string)
  default     = ["critical", "urgent"]
}

# Lambda Configuration
variable "lambda_processing_timeout" {
  description = "Timeout in seconds for the broker API processor Lambda"
  type        = number
  default     = 30
}

# Tags
variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}

variable "sqs_message_retention_days" {
  description = "Number of days to retain messages in SQS"
  type        = number
  default     = 1
}

variable "max_message_retries" {
  description = "Max retries before sending to DLQ"
  type        = number
  default     = 3
}