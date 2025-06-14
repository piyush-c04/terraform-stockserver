# Dead-letter queue for failed messages
resource "aws_sqs_queue" "dlq" {
  name                      = "${var.broker_sns_topic_name}-dlq"
  message_retention_seconds = 1209600  # 14 days (max)
  tags                      = var.tags
}

# Main queue with DLQ redrive policy
resource "aws_sqs_queue" "broker_events" {
  name                      = "${var.broker_sns_topic_name}-queue"
  delay_seconds             = 0
  max_message_size          = 262144  # 256KB
  message_retention_seconds = 86400   # 1 day
  receive_wait_time_seconds = 10      # Enable long polling

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 3  # Retry attempts before DLQ
  })

  tags = var.tags
}

# SNS → SQS Subscription
resource "aws_sns_topic_subscription" "sns_to_sqs" {
  topic_arn = aws_sns_topic.broker_api_events.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.broker_events.arn
}

# Allow SNS to send messages to SQS
resource "aws_sqs_queue_policy" "allow_sns" {
  queue_url = aws_sqs_queue.broker_events.id
  policy    = data.aws_iam_policy_document.sns_to_sqs.json
}

data "aws_iam_policy_document" "sns_to_sqs" {
  statement {
    actions   = ["sqs:SendMessage"]
    resources = [aws_sqs_queue.broker_events.arn]
    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_sns_topic.broker_api_events.arn]
    }
  }
}