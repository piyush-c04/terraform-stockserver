variable "sns_topic_arn" {
  description = "ARN of the SNS topic for alerts"
  type        = string
}

variable "kinesis_stream_name" {
  type = string
}

variable "batch_job_queue" {
  type = string
}

variable "dynamodb_table_name" {
  type = string
}

variable "asg_name" {
  type = string
}