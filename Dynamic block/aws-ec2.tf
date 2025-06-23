resource "aws_instance" "web" {
  for_each      = toset(var.server_names) 
  # ---->this is the for_each loop
  # count = 3 # Create two instances for testing ---> it the count based loop
  ami           =  var.ami_id # Replace with your AMI ID
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

dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
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

