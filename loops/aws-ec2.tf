resource "aws_instance" "web" {
  for_each      = toset(var.server_names) 
  # ---->this is the for_each loop
  # count = 3 # Create two instances for testing ---> it the count based loop
  ami           =  var.ami_id 
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg_with_terraform.id]

  tags = {
     Name =  each.key
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

