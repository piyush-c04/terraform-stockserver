# S3 Specific Variables
variable "bucket_name" {
  description = "Name for the S3 bucket "
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "block_public_access" {
  description = "Block all public access to the bucket"
  type        = bool
  default     = true
}

variable "region" {
  description = "Showcases the region you want your bucket in"
  type = string
  default = "ap-south-1"
}

variable "encryption_algorithm" {
  description = "Server-side encryption algorithm"
  type        = string
  default     = "AES256" # Options: AES256, aws:kms
}