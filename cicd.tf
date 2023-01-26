
resource "aws_security_group" "ex_cicd_sg" {
  name        = "ex_cicd_sg"
  description = "Access for the application"
  vpc_id      = "vpc-08a88b8c122c17676"

  ingress {
    description = "SSH for Admins"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    /* security_groups = [aws_security_group.bastion_sg.id] */
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "End User access for applcation"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ex_cicd_sg"
  }
}

resource "aws_instance" "ex_cicd" {
  // vpc_id                      = aws_vpc.dev_vpc.id
  subnet_id                   = "subnet-079764f02dc006ddd"
  ami                         = "ami-0f822d3c9e0532335"
  associate_public_ip_address = true
  instance_type               = "t4g.small"
  vpc_security_group_ids      = [aws_security_group.ex_cicd_sg.id]
  user_data                   = "${file("cicd.sh")}"
  key_name                    = aws_key_pair.example.id
  iam_instance_profile        = aws_iam_instance_profile.artifact_bucket.name 

  tags = {
    Name = "ex_cicd"
  }
    lifecycle {
    create_before_destroy = true  
  }
}
