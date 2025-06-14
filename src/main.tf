# module "storage" {
#   source = "./modules/Storage"
# }


module "kinesis" {
  source       = "./modules/kinesis"
  stream_name  = "stock-data-stream"
  shard_count  = 2
  tags = {
    Environment = "prod"
  }
}

module "dynamodb" {
  source    = "./modules/dynamodb"
  table_name = "stock-ohlc-data"
  ttl_days  = 3
}

module "lambda" {
  source              = "./modules/lambda"
  function_name       = "stock-processor"
  source_endpoints    = ["https://api.marketdata.com/v1/ohlc"]
  kinesis_stream_arn  = module.kinesis.arn
  dynamodb_table_name = module.dynamodb.table_name
}

# Connect IAM policies
resource "aws_iam_role_policy_attachment" "poller_kinesis" {
  role       = module.lambda.poller_role_name
  policy_arn = module.kinesis.producer_policy_arn
}

resource "aws_iam_role_policy_attachment" "transformer_dynamodb" {
  role       = module.lambda.transformer_role_arn
  policy_arn = module.dynamodb.lambda_policy_arn
}