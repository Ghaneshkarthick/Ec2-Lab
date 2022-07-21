resource "aws_security_group" "ansible_server" {
  name        = "ansible_server"
  description = "Allow ansible connection inbound traffic"
  vpc_id      = data.aws_vpc.ansible_server_vpc.id

  ingress {
    description      = "Open Port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["103.91.88.205/32"]
  }
  ingress {
    description      = "Open Port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.91.88.205/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Open Port 80"
  }
}