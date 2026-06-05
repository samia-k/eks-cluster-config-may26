resource "aws_s3_bucket" "main" {
  bucket = format("%s-%s-%s", var.application, var.environment, var.region)

  tags = {
    Environment = var.environment
    Application = var.application
    Owner       = var.owner
    CostCentre  = var.cost_centre
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "s3_kms" {
  description             = "This key is used to encrypt s3 bucket objects"
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = true
  rotation_period_in_days = var.rotation_period_in_days
}

resource "aws_kms_alias" "kms_alias" {
  name          = format("alias/%s-%s-%s", var.application, var.environment, var.region)
  target_key_id = aws_kms_key.s3_kms.key_id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_kms.arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled       = true
    blocked_encryption_types = ["SSE-C"]
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_policy" {
  bucket = aws_s3_bucket.main.id

  rule {
    id = "medireports-transition-policy"

    filter {}

    transition {
      days = 90
      storage_class = "STANDARD_IA"
    }

    transition {
      days = 365
      storage_class = "DEEP_ARCHIVE"
    }    

    expiration {
      days = 2555
    }

    noncurrent_version_expiration {
      noncurrent_days = 365
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }

    status = "Enabled"
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  //deny https
  statement {
    sid    = "DenyInsecureTransport"
    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:*"]

    resources = [
      aws_s3_bucket.main.arn,
      "${aws_s3_bucket.main.arn}/*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}

resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}