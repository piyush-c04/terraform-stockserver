# Poller Lambda
resource "aws_lambda_function" "poller" {
  filename      = "lambda/poller.zip"
  function_name = "${var.function_name}-poller"
  role          = aws_iam_role.poller.arn
  handler       = "index.handler"
  runtime       = "python3.9"
  timeout       = 30

  environment {
    variables = {
      API_URL       = var.source_endpoints[0]
      STREAM_ARN    = var.kinesis_stream_arn
    }
  }
}

# Transformer Lambda
resource "aws_lambda_function" "transformer" {
  filename      = "lambda/transformer.zip"
  function_name = "${var.function_name}-transformer"
  role          = aws_iam_role.transformer.arn
  handler       = "index.handler"
  runtime       = "python3.9"

  environment {
    variables = {
      TABLE_NAME = var.dynamodb_table_name
    }
  }
}

# IAM Roles
resource "aws_iam_role" "poller" {
  name = "${var.function_name}-poller-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role" "transformer" {
  name = "${var.function_name}-transformer-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# Event Mapping
resource "aws_lambda_event_source_mapping" "this" {
  event_source_arn  = var.kinesis_stream_arn
  function_name     = aws_lambda_function.transformer.arn
  starting_position = "LATEST"
}