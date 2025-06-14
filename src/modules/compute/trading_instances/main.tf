# Launch Template for Indicator Calculators
resource "aws_launch_template" "indicator_calculator" {
  name_prefix   = "indicator-calc-"
  image_id      = var.indicator_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = var.security_group_ids
    subnet_id                  = var.subnet_id
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Role = "indicator-calculator"
    }
  }
}

# Launch Template for Strategy Evaluators
resource "aws_launch_template" "strategy_evaluator" {
  name_prefix   = "strategy-eval-"
  image_id      = var.strategy_ami
  instance_type = var.instance_type
  key_name      = var.key_name

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = var.security_group_ids
    subnet_id                  = var.subnet_id
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Role = "strategy-evaluator"
    }
  }
}

# Auto Scaling Group for Indicator Calculators
resource "aws_autoscaling_group" "indicator_calculators" {
  name_prefix          = "indicator-calc-asg-"
  vpc_zone_identifier = [var.subnet_id]
  min_size            = var.indicator_instance_count
  max_size            = var.indicator_instance_count * 2
  desired_capacity    = var.indicator_instance_count

  launch_template {
    id      = aws_launch_template.indicator_calculator.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "indicator-calculator"
    propagate_at_launch = true
  }
}

# Auto Scaling Group for Strategy Evaluators
resource "aws_autoscaling_group" "strategy_evaluators" {
  name_prefix          = "strategy-eval-asg-"
  vpc_zone_identifier = [var.subnet_id]
  min_size            = var.strategy_instance_count
  max_size            = var.strategy_instance_count * 2
  desired_capacity    = var.strategy_instance_count

  launch_template {
    id      = aws_launch_template.strategy_evaluator.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "strategy-evaluator"
    propagate_at_launch = true
  }
}