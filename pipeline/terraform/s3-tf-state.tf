data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "state" {
  #checkov:skip=CKV_AWS_144 - No needed cross-region replication enabled
  #checkov:skip=CKV_AWS_21 - No needed versioning enabled
  #checkov:skip=CKV_AWS_18 - No needed access log enabled
  #checkov:skip=CKV_AWS_145 - S3 default encryption enabled
  #checkov:skip=CKV2_AWS_61 - No needed lifecycle configuration
  #checkov:skip=CKV2_AWS_62 - No needed notification
  bucket = "backend-terraform-pipeline-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  bucket = aws_s3_bucket.state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "state" {
  bucket                  = aws_s3_bucket.state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

