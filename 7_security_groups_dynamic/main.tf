provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "terraform-ec2" {
  ami             = "ami-0c20d88b0021158c6" # take it from console
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
}

variable "ingressrules" {
  type    = list(number)
  default = [80, 443]
}

variable "egressrules" {
  type    = list(number)
  default = [80, 443, 25, 3306, 53, 8000]
}

resource "aws_security_group" "webtraffic" {
  name = "Allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      description      = "HTTPS"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      description      = "HTTPS"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  }
}
