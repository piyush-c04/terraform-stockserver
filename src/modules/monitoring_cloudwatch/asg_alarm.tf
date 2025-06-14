resource "aws_cloudwatch_metric_alarm" "asg_high_cpu" {
  alarm_name          = "${var.asg_name}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120  # 2 minutes
  statistic           = "Average"
  threshold           = 80   # 80% CPU
  alarm_description   = "ASG CPU over 80%"
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }
}