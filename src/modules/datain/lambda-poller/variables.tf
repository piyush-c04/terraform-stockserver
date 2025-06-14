variable "function_name" {
  description = "Lambda function name"
  type        = string
}

variable "source_endpoints" {
  description = "Allowed API endpoints for polling"
  type        = list(string)
  default     = []
}

variable "kinesis_stream_arn" {
  description = "Target Kinesis stream ARN"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Destination DynamoDB table name"
  type        = string
}