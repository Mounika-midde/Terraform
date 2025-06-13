
#creating internet gateway 
resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id
  tags = {
    Name = "lab-igw"
  }
}