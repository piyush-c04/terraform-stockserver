//Storage Module
bucket_name          = "stock-historical-s3"
enable_versioning    = true
block_public_access  = true
region = "ap-south-1"

//Instance group Module
instance_type = "t2.micro"
key_name = "aws_login_key_whatever"
subnet_id = "subnet-01ba2a381d6c4246d"
indicator_ami = "ami-0f918f7e67a3323f0"
indicator_instance_count = 3 #default is 2
strategy_ami = "ami-0f918f7e67a3323f0"
strategy_instance_count = 3 #default is 2
security_group_ids = [ "sg-02ea3c7e489bcfc23", "sg-05777addd080c8823"]

