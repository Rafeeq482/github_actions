provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                   = "instance-${var.environment}"
  instance_type          = "t2.micro"
  key_name               = "SNS"
  monitoring             = true
  vpc_security_group_ids = ["sg-0fef0819f181d85b9"]
  subnet_id              = "subnet-092ea30ffb0421a84"

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "instance-${var.environment}"
  }
}
