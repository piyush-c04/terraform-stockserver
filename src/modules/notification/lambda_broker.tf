resource "aws_lambda_function" "api_processor" {
  filename      = "lambda/api_processor.zip"
  function_name = "broker-api-processor"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "index.handler"
  runtime       = "python3.9"
  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.broker_api_events.arn
    }
  }
}
resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.broker_events.arn
  function_name    = aws_lambda_function.api_processor.arn
  batch_size       = 10  # Process up to 10 messages per invocation
}

# Add SQS permissions to Lambda execution role
resource "aws_iam_role_policy_attachment" "lambda_sqs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"  # Narrow this down for production
}
# Example Lambda code (pseudo-code)
# ```python
# import boto3
# sns = boto3.client('sns')
#
# def handler(event, context):
#     # Process SQS messages
#     sns.publish(
#         TopicArn=os.environ['SNS_TOPIC_ARN'],
#         Message="New broker event: " + str(event),
#         Subject="Broker API Alert",
#         MessageAttributes={
#             'severity': {'DataType': 'String', 'StringValue': 'high'}
#         }
#     )
