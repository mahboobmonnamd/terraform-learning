provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "terraform-ec2" {
  ami = "ami-0c20d88b0021158c6" # take it from console
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.terraform-ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}
