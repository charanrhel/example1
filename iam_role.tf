#Policy
resource "aws_iam_policy" "artifact_bucket" {
  name        = "artifact_bucket_policy"
  path        = "/"
  description = "Policy for S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "ecr:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

  tags = {
    Name = "EC2-S3-Policy"
  }
}

//Role
resource "aws_iam_role" "artifact_bucket" {
  name = "artifact_bucket_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "EC2-S3-role"
  }
}

//Attach policy to role
resource "aws_iam_role_policy_attachment" "artifact_bucket" {
  role       = aws_iam_role.artifact_bucket.name
  policy_arn = aws_iam_policy.artifact_bucket.arn
}

//Attach role to EC2
resource "aws_iam_instance_profile" "artifact_bucket" {
  name = "artifact_bucket_attach_role"
  role = aws_iam_role.artifact_bucket.name
}