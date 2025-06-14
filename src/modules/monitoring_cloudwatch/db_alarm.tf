resource "aws_cloudwatch_metric_alarm" "dynamodb_throttles" {
  alarm_name          = "${var.dynamodb_table_name}-write-throttles"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "WriteThrottleEvents"
  namespace           = "AWS/DynamoDB"
  period              = 60  # 1 minute
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "DynamoDB write throttling"
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    TableName = var.dynamodb_table_name
  }
}