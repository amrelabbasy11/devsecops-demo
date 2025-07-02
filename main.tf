provider "aws" {
  region = "eu-central-1"
}

# Insecure S3 bucket (for demo purposes - tfsec will flag this)
resource "aws_s3_bucket" "amr_bucket" {
  bucket = "amr-devsecops-demo-bucket"
  acl    = "public-read" # tfsec will detect this as insecure

  tags = {
    Owner = "Amr"
    Env   = "Dev"
  }
}

# IAM Policy for read-only access (best practice enforcement)
resource "aws_iam_policy" "readonly" {
  name   = "readonly-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject"
        ],
        Resource = "*"
      }
    ]
  })
}
# main.tf
provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "amr_bucket" {
  bucket = "amr-devsecops-demo-bucket"
  acl    = "public-read"  # tfsec will warn about this

  tags = {
    Owner = "Amr"
    Env   = "Dev"
  }
}

