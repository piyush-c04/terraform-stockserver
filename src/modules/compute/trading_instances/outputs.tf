# Indicator Calculator Outputs
output "indicator_launch_template_id" {
  description = "Launch Template ID for indicator calculators"
  value       = aws_launch_template.indicator_calculator.id
}

output "indicator_asg_name" {
  description = "Auto Scaling Group name for indicator calculators"
  value       = aws_autoscaling_group.indicator_calculators.name
}

# Strategy Evaluator Outputs
output "strategy_launch_template_id" {
  description = "Launch Template ID for strategy evaluators"
  value       = aws_launch_template.strategy_evaluator.id
}

output "strategy_asg_name" {
  description = "Auto Scaling Group name for strategy evaluators"
  value       = aws_autoscaling_group.strategy_evaluators.name
}

# Common Outputs
output "instance_type_used" {
  description = "The instance type used for both services"
  value       = var.instance_type
}