# main.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "amr_bucket" {
  bucket = "amr-devsecops-demo-bucket"
  acl    = "public-read"  # tfsec will warn about this

  tags = {
    Owner = "Amr"
    Env   = "Dev"
  }
}

