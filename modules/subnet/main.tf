#create subnet for public
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
     Name = "lab-subnet-public${count.index + 1}"
 }
}

#create a subnet for private
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags = { 
    Name = "lab-subnet-private${count.index + 1}" 
  }
}
