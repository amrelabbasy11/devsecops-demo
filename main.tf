# Provider for my application resources
provider "aws" {
  alias  = "app"
  region = "eu-central-1"
}

# Provider for AWS Organizations (must be us-east-1)
provider "aws" {
  alias  = "org"
  region = "us-east-1"
}

#########################
# S3 bucket (demo, insecure ACL)
#########################
resource "aws_s3_bucket" "amr_bucket" {
  provider = aws.app
  bucket   = "amr-devsecops-demo-bucket"
  acl      = "public-read"  # This is insecure, will be blocked by SCP

  tags = {
    Owner = "Amr"
    Env   = "Dev"
  }
}

#########################
# IAM Policy for read-only S3 access
#########################
resource "aws_iam_policy" "readonly" {
  provider = aws.app
  name     = "readonly-policy"
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

#########################
# Organization SCP that denies public-read ACL on S3 buckets
#########################
resource "aws_organizations_policy" "deny_public_s3" {
  provider    = aws.org
  name        = "DenyPublicS3Access"
  description = "Deny creating or modifying S3 buckets with public-read ACL"
  type        = "SERVICE_CONTROL_POLICY"
  content     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketAcl",
        "s3:PutObjectAcl"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "public-read"
        }
      }
    }
  ]
}
POLICY
}

#########################
# Attach the SCP to your AWS Organization root
#########################
resource "aws_organizations_policy_attachment" "deny_public_s3_attach" {
  provider  = aws.org
  policy_id = aws_organizations_policy.deny_public_s3.id
  target_id = "r-f7ni" 
}
