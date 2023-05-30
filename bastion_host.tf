# Create bastion host
resource "aws_instance" "bastion" {
  ami           = var.image_id
  instance_type = var.instance_type
  # key_name = "${aws_key_pair.ec2_key.key_name}"
  vpc_security_group_ids = [ aws_security_group.bastion-sg ]
  # user_data = data.template_file.user_data.rendered
  tags = {
    Name = "project-x-Bastion-Host"
    Environment = "prod"
  }
}

# Print Public Ip address
output "public_ip" {
    value = aws_instance.bastion.public_ip
}
