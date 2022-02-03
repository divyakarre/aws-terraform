resource "aws_s3_bucket" "b" {
    count = length(var.bucket_name)
  bucket = var.bucket_name[count.index]
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}