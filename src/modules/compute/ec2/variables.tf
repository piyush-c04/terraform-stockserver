variable "ami_id_indi" {
  description = "The ami id of selected guest OS , here were using Free tier eligible Verified provider Ubuntu Server 24.04 LTS (HVM), SSD Volume Type (64-bit (x86))"
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "ami_id_strat" {
  description = "The ami id of selected guest OS , here were using Free tier eligible Verified provider Ubuntu Server 24.04 LTS (HVM), SSD Volume Type (64-bit (x86))"
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_count" {
    description = "This is the number of instances that would be deployed"
    type = number
    default = 5
}
variable "instance_type" {
  description = "This is the type of instance offered by aws | can be different variables for different tasks"
  type = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
  description = "The partition where the ec2 will be running inside a vpc"
  default = "subnet-01ba2a381d6c4246d"
}

variable "vpc_security_group_ids" {
  type = list
  description = "The vpc security groups of firewall in which the subnets are present"
  default = ["sg-02ea3c7e489bcfc23", "sg-05777addd080c8823" ]
}