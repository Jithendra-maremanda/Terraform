variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-09c813fb71547fc4f" # Replace with your AMI ID
  
}

# these are the variables used in the Terraform configuration for creating an EC2 instance names
variable "server_names" {
  default = ["alpha", "beta", "gamma"]
}



variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "dev" # Default to dev environment
  
}

variable "aws_security_group_name" {
  description = "The name of the security group to create"
  type        = string
  default     = "sg_with_terraform"
  
}
variable "ec2_instance_name" {
  description = "The name tag for the EC2 instance"
  type        = string
  default     = "terraform-ec2-instance"
  
}