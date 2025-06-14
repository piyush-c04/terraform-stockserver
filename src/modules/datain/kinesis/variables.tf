# variable "ohlc_data" {
#   description = "Example OHLC stock data structure."
#   type = object({
#     status = string
#     data = object({
#       candles = list(
#         # Each candle is a tuple (fixed-size list) to enforce the order and types
#         tuple([string, number, number, number, number, number])
#       )
#     })
#   })
#   default = {
#     status = "success"
#     data = {
#       candles = [
#         [
#           "2025-06-10T09:15:00+05:30", # Timestamp
#           0,                     # Open
#           0,                     # High
#           0,                     # Low
#           0,                     # Close
#           0                     # Volume
#         ],
#       ]
#     }
#   }
# }

variable "source_endpoints" {
  description = "Allowed source endpoints for PutRecord permissions"
  type        = list(string)
  default     = ["endlpoint.com"]
}


variable "stream_name" {
  description = "Name of the Kinesis stream"
  type        = string
}

variable "shard_count" {
  description = "Number of shards (1 shard = 1MB/s write capacity)"
  type        = number
  default     = 1
}

variable "retention_hours" {
  description = "Data retention period in hours"
  type        = number
  default     = 24
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}