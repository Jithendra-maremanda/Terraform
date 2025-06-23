resource "aws_instance" "web" {
  ami           =  var.ami_id # Replace with your AMI ID
  instance_type = var.instance_type == "dev" ? "t3.micro" : "t3.small" # Use t3.micro for dev, t3.small for other environments
  vpc_security_group_ids = [aws_security_group.sg_with_terraform.id]

  tags = {
     Name =  var.ec2_instance_name
  }
}


resource "aws_security_group" "sg_with_terraform" {
  name        = var.aws_security_group_name
  # The name of the security group to create
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
    Name = var.aws_security_group_name
  }
}

