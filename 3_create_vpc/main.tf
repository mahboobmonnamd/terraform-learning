provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "vpc1" {
    cidr_block = "192.168.0.0/24"
    tags = {
      Name = "TerraformVPC"
    }
}

output "myoutput" {
    value = aws_vpc.vpc1.id
}
