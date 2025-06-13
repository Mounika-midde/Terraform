
#variable for ami_id
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

#variable for instance type
variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

#variable for  subnet_id
variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}
#variable for security group
variable "sg_id" {
  description = "Security Group ID to attach to EC2"
  type        = string
}
