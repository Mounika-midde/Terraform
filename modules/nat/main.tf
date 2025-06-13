
#create a nat gateway 
resource "aws_eip" "nat" {
  tags = {
    Name = "lab-nat"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "lab-nat"
  }
}