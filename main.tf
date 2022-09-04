
resource "aws_instance" "web" {
  ami           = "ami-08f3d892de259504d"
  instance_type = var.instance_type
  key_name      = "terraform-demo"

  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.public_us_east_1a.id


  user_data = <<EOF
 #!/bin/bash
 yum update -y 
 yum install -y httpd
 echo 'This is a demo instance' > /var/www/html/index.html
 systemctl start httpd
 systemctl enable httpd
 EOF

  tags = {
    Name = "Single-Instance"
  }

}


