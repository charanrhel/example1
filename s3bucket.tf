resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "artifact-bucket-26012023"

  tags = {
    Name        = "Artifactory"
  }
}

/* resource "aws_iam_role" "artifact_bucket" {
  name = "artifact_bucket_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY

tags = {
  Name = "EC2-S3-policy"
}
}

resource "aws_iam_policy" "artifact_bucket" {
  name = "artifact_bucket_policy"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
POLICY

tags = {
  Name = "EC2-S3-policy"
}
}

resource "aws_iam_role_policy_attachment" "artifact_bucket" {
  role       = aws_iam_role.artifact_bucket.name
  policy_arn = aws_iam_policy.artifact_bucket.arn
}

resource "aws_iam_instance_profile" "artifact_bucket" {
  name = "bucket_ec2"
  role = aws_iam_role.artifact_bucket.name
} */