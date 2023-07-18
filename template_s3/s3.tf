resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket

}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
   {
  
  "Version": "2012-10-17",
  "Statement": [
    "Action" : "s3:*",
    "Effect": "Allow",
    "Resource" : "arn:aws:s3:::${aws_s3_bucket.bucket.bucket}/*",
    "Principal": "*"
      }
    ]
  })

  depends_on = [
    aws_s3_bucket.bucket
  ]
}