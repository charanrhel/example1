resource "aws_security_group" "docker_sg" {
  name        = "docker_sg"
  description = "Access for the application"
  vpc_id      = "vpc-08a88b8c122c17676"

  ingress {
    description     = "SSH for Admins"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    /* security_groups = [aws_security_group.bastion_sg.id] */
    cidr_blocks = ["0.0.0.0/0"]
  }

  /* ingress {
    description = "End User access for applcation"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } */


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "docker_sg"
  }
}

resource "aws_instance" "docker" {
  subnet_id                   = "subnet-0a80be13a606b1c9d"
  ami                         = "ami-0652d397074720eb1"
  associate_public_ip_address = true
  instance_type               = "t4g.xlarge"
  vpc_security_group_ids      = [aws_security_group.docker_sg.id]
  //user_data                   = "${file("docker.sh")}"
  key_name                    = aws_key_pair.example.id
  
  tags = {
    Name = "docker"
  }
}