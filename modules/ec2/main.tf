
#creating ec2 instance and user_data
resource "aws_instance" "web" {
  ami                    = var.ami_id  
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
   key_name               = "terraform-keypair"  #key-pair of instance

#user_data to install git and clone github link
 user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd git
              systemctl enable httpd
              systemctl start httpd

              rm -rf /var/www/html/*
              git clone https://github.com/siddhantbhattarai/DevOps-Static-Website-Deployment.git /var/www/html
          
              systemctl restart httpd
              EOF


#tag of instance
  tags = {
    Name = "WebServer"
  }


}
#to print output of public_ip
output "public_ip" {
  value = aws_instance.web.public_ip
}
