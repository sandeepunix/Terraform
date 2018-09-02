resource "aws_autoscaling_policy" "cpu-policy" {
  name = "cpu-policy"
  autoscaling_group_name = "${aws_autoscaling_group.example-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown              = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "example-cpu-alarm" {
  alarm_name = "example-cpu-alarm"
  alarm_description= "example-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period    = "120"
  statistic = "Average"
  threshold = 30
  
  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.example-autoscaling.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.cpu-policy.arn}"]
}

#scale down alarm
resource "aws_autoscaling_policy" "cpu-policy-scaldown" {
  name = "cpu-policy-scaldown"
  autoscaling_group_name = "${aws_autoscaling_group.example-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scaldown" {
  alarm_name = "cpu-alarm-scaldown"
  alarm_description= "cpu-alarm-scaldown"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period    = "120"
  statistic = "Average"
  threshold = 5
  
  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.example-autoscaling.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.cpu-policy.arn}"]
}

  
