variable "table_name" {
  description = "DynamoDB table name"
  type        = string
}

variable "ttl_days" {
  description = "TTL expiration in days"
  type        = number
  default     = 7
}