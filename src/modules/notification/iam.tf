# Allow Lambda to publish to SNS
resource "aws_iam_role_policy_attachment" "lambda_sns_publish" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"  # Narrow this down for production
}

# Allow CloudWatch to publish to SNS
data "aws_iam_policy_document" "cloudwatch_sns_policy" {
  statement {
    actions    = ["sns:Publish"]
    principals {
      type        = "Service"
      identifiers = ["cloudwatch.amazonaws.com"]
    }
    resources = [aws_sns_topic.cloudwatch_alerts.arn]
  }
}

resource "aws_sns_topic_policy" "cloudwatch" {
  arn    = aws_sns_topic.cloudwatch_alerts.arn
  policy = data.aws_iam_policy_document.cloudwatch_sns_policy.json
}