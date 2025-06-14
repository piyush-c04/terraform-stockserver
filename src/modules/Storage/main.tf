resource "aws_s3_bucket" "historical_stock_data_storage" {
  bucket = var.bucket_name
  region = var.region
  

  tags = {
    Name        = "stock-historical"
    Environment = "Dev"
  }
}

//Well Architected Practises from AWS choose asper your requirement
# Bucket Versioning
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.historical_stock_data_storage.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Disabled"
  }
}

# Public Access Block
resource "aws_s3_bucket_public_access_block" "this" {
  count                   = var.block_public_access ? 1 : 0
  bucket                  = aws_s3_bucket.historical_stock_data_storage.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

//server side encryption is default so no need to make another resource stating the same
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.historical_stock_data_storage.id
  
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.encryption_algorithm 
    }
  }
}

