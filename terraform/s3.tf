# Resource to create S3 bucket
resource "aws_s3_bucket" "two-buckets" {
  count  = length(var.s3_bucket_names) // count is 2
  bucket = var.s3_bucket_names[count.index]
}

# Redirection to subdomain
resource "aws_s3_bucket_website_configuration" "s3_root_website" {
  bucket = var.s3_bucket_names[0]

  redirect_all_requests_to {
    host_name = var.subdomain
    protocol  = "https"
  }
}

# Index document defined
resource "aws_s3_bucket_website_configuration" "s3_sub_website" {
  bucket = var.s3_bucket_names[1]
  index_document {
    suffix = "index.html"
  }
}

# ACL for root and subdomain buckets
resource "aws_s3_bucket_acl" "s3_bucket_acl_root" {
  bucket = var.s3_bucket_names[0]
  acl    = "public-read"
}

resource "aws_s3_bucket_acl" "s3_bucket_acl_sub" {
  bucket = var.s3_bucket_names[1]
  acl    = "public-read"
}

# Bucket versioning enabled for root and subdomain
resource "aws_s3_bucket_versioning" "s3_version_root" {
  bucket = var.s3_bucket_names[0]
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "s3_version_sub" {
  bucket = var.s3_bucket_names[1]
  versioning_configuration {
    status = "Enabled"
  }
}