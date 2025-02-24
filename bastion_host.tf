resource "aws_instance" "bastion" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = element([for each_subnet in aws_subnet.public_subnet : each_subnet.id], 0)
  tags = {
    Name = local.bastion_host
  }
  vpc_security_group_ids = [aws_security_group.bastion_host.id]
}