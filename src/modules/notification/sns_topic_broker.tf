# SNS Topic for processed API requests
resource "aws_sns_topic" "broker_api_events" {
  name = "broker-api-events-topic"
  tags = {
    Pipeline = "broker-api-to-sqs"
  }
}

# Lambda publishes to this SNS after processing
resource "aws_sns_topic_subscription" "broker_sms_alerts" {
  topic_arn = aws_sns_topic.broker_api_events.arn
  protocol  = "sms"
  endpoint  = "+91951234567" 
}

# Optional: Email subscriber
resource "aws_sns_topic_subscription" "broker_email_alerts" {
  topic_arn = aws_sns_topic.broker_api_events.arn
  protocol  = "email"
  endpoint  = "alerts@yourdomain.com"
}