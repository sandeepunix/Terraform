resource "aws_instance" "jenkins-instance" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.main-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.jenkins-securitygroup.id}"]
  key_name = "${aws_key_pair.mykeypair.key_name}"
  user_data = "${data.template_cloudinit_config.cloudinit-jenkins.rendered}"
}

resource "aws_ebs_volume" "jenkins-data" {
  availability_zone = 	"ap-south-1a"
  size = 20
  type = "gp2"
  tags {
        Name = "jenkins-data"
    }
}

resource "aws_volume_attachment" "jenkins-data-attachment" {
   device_name = "${var.INSTANCE_DEVICE_NAME}"
   volume_id = "${aws_ebs_volume.jenkins-data.id}"
   instance_id = "${aws_instance.jenkins-instance.id}"
}

resource "aws_instance" "app-instance" {
   count = "${var.APP_INSTANCE_COUNT}"
   name = "app-instance"
   ami = "${lookup(var.AMIS, var.AWS_REGION)}"
   instance_type = "t2.micro"
   subnet_id = "${aws_subnet.main-public-1.id}"
   vpc_security_group_ids = ["${aws_security_group.app-securitygroup.id}"]
   key_name = "${aws_key_pair.mykeypair.key_name}"

}
 
  



