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

module "cloudwatch_monitoring" {
  source = "./modules/cloudwatch"

  sns_topic_arn       = aws_sns_topic.alerts.arn
  kinesis_stream_name = module.kinesis.name
  batch_job_queue     = module.batch.job_queue_name
  dynamodb_table_name = module.dynamodb.table_name
  asg_name           = module.autoscaling.asg_name
}


module "networking" {
  source = "./modules/networking"

  vpc_name = "production-vpc"
  cidr_block = "10.1.0.0/16"
  azs       = ["us-east-1a", "us-east-1b"]

  public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnet_cidrs = ["10.1.101.0/24", "10.1.102.0/24"]

  tags = {
    Environment = "production"
  }
}