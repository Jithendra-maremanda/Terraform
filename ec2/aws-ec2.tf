resource "aws_instance" "web" {
  ami           = "ami-09c813fb71547fc4f" # Replace with your AMI ID
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg_with_terraform.id]

  tags = {
    Name = "example-instance"
  }
}


resource "aws_security_group" "sg_with_terraform" {
  name        = "sg_with_terraform"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_with_terraform"
  }
}

