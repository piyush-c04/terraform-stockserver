# Dedicated SNS for infrastructure alerts
resource "aws_sns_topic" "cloudwatch_alerts" {
  name = "cloudwatch-alerts-topic"
  tags = {
    Purpose = "infrastructure-monitoring"
  }
}

# SMS subscriber for critical alerts
resource "aws_sns_topic_subscription" "cloudwatch_sms" {
  topic_arn = aws_sns_topic.cloudwatch_alerts.arn
  protocol  = "sms"
  endpoint  = "+15557654321"  # Replace with ops team number
  filter_policy = jsonencode({
    severity = ["critical"]  # Only forward high-priority alerts
  })
}

# Connect CloudWatch Alarms to SNS
# resource "aws_cloudwatch_metric_alarm" "example" {
#   alarm_name        = "kinesis-throttles-alarm"
#   alarm_description = "Triggered when Kinesis throttles occur"
#   alarm_actions     = [aws_sns_topic.cloudwatch_alerts.arn]  # << Key link
#   # ... (other alarm config) ...
# }