// ランダムな文字で一意なリソース名にする
resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-bucket-${random_string.bucket_suffix.result}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "Test Bucket"
  }
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

