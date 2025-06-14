resource "aws_cloudwatch_metric_alarm" "batch_failures" {
  alarm_name          = "${var.batch_job_queue}-failed-jobs"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FailedJobs"
  namespace           = "AWS/Batch"
  period              = 300
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "Batch jobs are failing"
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    JobQueue = var.batch_job_queue
  }
}