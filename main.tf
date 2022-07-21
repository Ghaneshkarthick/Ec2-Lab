resource "aws_instance" "Ansible_web" {
  ami           = data.aws_ami.Ubuntu_server.id
  instance_type = "t3.micro"

  #VPC
vpc_security_group_ids = [aws_security_group.ansible_server.id] #VPC
#Keypair
key_name = "Ansible_lab_key" 
#Subnet_id
subnet_id = data.aws_subnet.public.id

  tags = {
    Name = "Tf-Ec2_instance"
  }

}



resource "aws_eip" "Ansible_web_eip" {
  instance = aws_instance.Ansible_web.id
  vpc      = true
}

