# Create S3 bucket
resource "aws_s3_bucket" "thanos" {
  bucket = "${local.s3_bucket_name}"
  acl    = "private"
  force_destroy = false
  tags = {
    Name        = "ThanosMetrics"
    Environment = "Dev"
  }
}

# Enable public access restrictions the bucket
resource "aws_s3_bucket_public_access_block" "thanos" {
  bucket = "${local.s3_bucket_name}"
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
