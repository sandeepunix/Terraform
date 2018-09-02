resource "aws_launch_configuration" "example-launchconfiguration" {
  name_prefix = "example-launchconfiguration"
  image_id = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykeypair.key_name}"
  security_groups      = ["${aws_security_group.allow-ssh.id}"]
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name = "example-autoscaling"
  vpc_zone_identifier = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
  launch_configuration = "${aws_launch_configuration.example-launchconfiguration.id}"
  min_size = 1
  max_size = 2
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true
  
  tags {
    key = "name"
    value = "EC2 instance"
    propagate_at_launch = true
  }  
}

