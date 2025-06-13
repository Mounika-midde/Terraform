
#variable for cidr block
variable "vpc_cidr" { 
  default = "10.0.0.0/16"
   }

#create variable for vpc name 
variable "vpc_name" { 
  default = "lab-vpc" 
  }

#create variable for public subnet cidr block
variable "public_subnet_cidrs" {
  default = ["10.0.0.0/24", "10.0.2.0/24"]
}

#create variable for private subnet cidr block
variable "private_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.3.0/24"]
}

#create variable for availability zone
variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "ami_id" {}

#variable for instance_type
variable "instance_type" {
   default = "t2.micro"
 }
