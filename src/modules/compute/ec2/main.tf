resource "aws_instance" "indicator_calculators" {
    ami = var.ami_id_indi
    instance_type = var.instance_type
    count = var.instance_count
    key_name = aws_key_pair.deployer.key_name
    monitoring = true

    tags = {
    Name = "indicator_calcs-${count.index + 1}"
  }
}

resource "aws_instance" "strategy_evaluators" {
    ami = var.ami_id_strat
    instance_type = var.instance_type
    count = var.instance_count
    key_name = aws_key_pair.deployer.key_name
    monitoring = true
    vpc_security_group_ids = var.vpc_security_group_ids
    subnet_id = var.subnet_id

    tags = {
    Name = "strategy_evals-${count.index + 1}"
  }
}

