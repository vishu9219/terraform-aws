terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
# You can change region to your own region for VPC
provider "aws" {
  region = "ap-south-1"
}

# Create a VPC
resource "aws_vpc" "vpc_one" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    made-by = "vishal"
    location = "bangalore"
  }
}


# create subnets needed for vpc
resource "aws_subnet" "vpn_one_subnet" {
  vpc_id     = aws_vpc.vpc_one.id
  cidr_block = "10.0.1.0/24"

  tags = {
  made-by = "vishal"
  location = "bangalore"
  }
}
