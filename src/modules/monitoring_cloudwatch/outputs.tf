output "kinesis_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.kinesis_write_throttles.arn
}

output "batch_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.batch_failures.arn
}