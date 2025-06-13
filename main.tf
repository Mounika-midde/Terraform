#here attach a vpc module 
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

#here attach a subnet module
module "subnets" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs = var.azs
}

#here attach a internet gateway module 
module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

#here attach a nat gateway module
module "nat" {
  source = "./modules/nat"
  public_subnet_id = module.subnets.public_subnet_ids[0]
}

#here attach a route table module
module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  nat_gateway_id = module.nat.nat_id
  public_subnet_ids = module.subnets.public_subnet_ids
  private_subnet_ids = module.subnets.private_subnet_ids
}

#here attach a security group module
module "sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

#here attach a ec2 module
module "ec2" {
  source         = "./modules/ec2"
  subnet_id      = module.subnets.public_subnet_ids[1]
  sg_id          =  module.sg.sg_id
  ami_id         = var.ami_id
  instance_type  = var.instance_type
}


