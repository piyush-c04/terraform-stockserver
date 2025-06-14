variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for instances"
  type        = string
  default = "subnet-01ba2a381d6c4246d"
}

# Indicator Calculator Specific
variable "indicator_ami" {
  description = "AMI ID for indicator calculator instances"
  type        = string
  default = "ami-0f918f7e67a3323f0"
}

variable "indicator_instance_count" {
  description = "Number of indicator calculator instances"
  type        = number
  default     = 2
}

# Strategy Evaluator Specific
variable "strategy_ami" {
  description = "AMI ID for strategy evaluator instances"
  type        = string
  default = "ami-0f918f7e67a3323f0"
}

variable "strategy_instance_count" {
  description = "Number of strategy evaluator instances"
  type        = number
  default     = 2
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default = ["sg-02ea3c7e489bcfc23", "sg-05777addd080c8823"]
}

# variable "ami_id_indi" {
# description = "The ami id of selected guest OS , here were using Free tier eligible Verified provider Ubuntu Server 24.04 LTS (HVM), SSD Volume Type (64-bit (x86))"
#   type = string
#   default = "ami-0f918f7e67a3323f0"
# }
# variable "instance_type" {
# description = "This is the type of instance offered by aws | can be different variables for different tasks"
#   type = string
#   default = "t2.micro"
# }

# variable "subnet_id" {
#   type = string
#   description = "The partition where the ec2 will be running inside a vpc"
#   default = "subnet-01ba2a381d6c4246d"
# }

# variable "instance_count" {
#     description = "This is the number of instances that would be deployed"
#     type = number
#     default = 2
# }






# Common Variables
