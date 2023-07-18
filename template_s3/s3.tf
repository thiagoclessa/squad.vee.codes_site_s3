resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
}
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = <<EOF
    {
        "Version": "2012-10-17",
        "Id": "Policy1663162260738",
        "Statement": [
            {
                "Sid": "Stmt1663162256001",
                "Effect": "Allow",
                "Principal": "*",
                "Action": "*",
                "Resource": "arn:aws:s3:::${var.bucket}/*"
            }
        ]
    }

  EOF

  depends_on = [
    aws_s3_bucket.bucket
  ]
}