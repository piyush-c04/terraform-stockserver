resource "aws_kinesis_stream" "this" {
  name             = var.stream_name
  shard_count      = var.shard_count
  retention_period = var.retention_hours
  encryption_type  = "KMS"

  stream_mode_details {
    stream_mode = "PROVISIONED"
  }

  tags = var.tags
}

resource "aws_iam_policy" "producer_access" {
  name        = "${var.stream_name}-producer-policy"
  description = "Allows PutRecord to Kinesis stream"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["kinesis:PutRecord", "kinesis:PutRecords"],
      Resource = aws_kinesis_stream.this.arn
    }]
  })
}