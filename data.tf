data "aws_ami" "Ubuntu_server" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }


  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "ansible_server_vpc" {
    filter {
    name   = "tag:Name"
    values = ["lab_vpc"]
  }
}
data "aws_subnet" "public" {
    filter {
    name   = "tag:Name"
    values = ["Public_Subnet"]
  }
}