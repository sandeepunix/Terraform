resource "aws_db_subnet_group" "mariadb-subnet" {
  name = "mariadb-subnet"
  subnet_ids = ["${aws_subnet.main-private-1.id}","${aws_subnet.main-private-2.id}"]
  tags {
      Name = "mariadb-subnet"
  }
}

resource "aws_db_parameter_group" "mariadb-parameter" {
  name = "mariadb-parameter"
  family = "mariadb10.2"
  description = "mariaDB parameter group"
	
  parameter {
  name = "max_allowed_packet"
  value = "16777216"
  }
}

resource "aws_db_instance" "mariadb" {
  allocated_storage = 10
  engine            = "mariadb"
  engine_version    = "10.2.12"
  instance_class    = "db.t2.micro"
  identifier       = "mariadb"
  name              = "mariadb"
  username          = "root"
  password          = "sandeep07"
  db_subnet_group_name = "${aws_db_subnet_group.mariadb-subnet.name}"
  parameter_group_name = "${aws_db_parameter_group.mariadb-parameter.name}"
  multi_az             = "false"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  storage_type = "gp2"
  backup_retention_period =  30
  availability_zone = "${aws_subnet.main-private-1.availability_zone}"
  skip_final_snapshot = true
  tags {
     name = "mariadb-instance"
  }
}
   
output 	"ip" { 
   value = "${aws_db_instance.mariadb.id}"   
}
