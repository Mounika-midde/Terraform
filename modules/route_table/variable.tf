
#variable for vpc id
variable "vpc_id" {}

#variable for  internet gateway
variable "igw_id" {}

#variable nat gateway 
variable "nat_gateway_id" {}

#variable for public subnet id
variable "public_subnet_ids" { 
    type = list(string) 
}

# variable private for subnet id
variable "private_subnet_ids" { 
    type = list(string) 
}