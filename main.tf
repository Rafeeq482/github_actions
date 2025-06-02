provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                   = "instance-${var.environment}"
  instance_type          = "t3.micro"
  key_name               = "SNS"
  monitoring             = true
  vpc_security_group_ids = ["sg-0fef0819f181d85b9"]
  subnet_id              = "subnet-06cdf6a7520a97aee"

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Name        = "instance-${var.environment}"
  }
}
