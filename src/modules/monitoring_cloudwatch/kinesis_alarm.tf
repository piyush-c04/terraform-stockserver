resource "aws_cloudwatch_metric_alarm" "kinesis_write_throttles" {
  alarm_name          = "${var.kinesis_stream_name}-write-throttles"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "WriteProvisionedThroughputExceeded"
  namespace           = "AWS/Kinesis"
  period              = 300  # 5 minutes
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "Kinesis write throttling detected"
  alarm_actions       = [var.sns_topic_arn]  # Your alerting SNS topic

  dimensions = {
    StreamName = var.kinesis_stream_name
  }
}

resource "aws_cloudwatch_log_group" "kinesis_logs" {
  name              = "/aws/kinesis/${var.kinesis_stream_name}"
  retention_in_days = 7
}