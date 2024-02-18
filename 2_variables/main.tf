# string
variable "vpcname" {
  type = string
  description = "set the vpc name"
}
# How to use `var.vpcname`

# number
variable "sshport" {
  type = number
  default = 22
}

# boolean
variable "enabled" {
  default = true
}

# list
variable "mylist" {
  type = list(string)
  default = [ "value 1", "value 2" ]
}
# How to use `var.mylist[0]`

# maps / JSON
variable "mymap" {
  type = map
  default = {
    Key1 = "value1"
    Key2 = "value2"
  }
}
# How to use `var.mymap["Key1"]`

provider "aws" {
    region = "eu-west-2"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = var.vpcname
    }
}

output "myoutput" {
    value = aws_vpc.myvpc.id
}