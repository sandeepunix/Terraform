resource "aws_key_pair" "mykeypair" {
  public_key = "${file("${var.AWS_PUBLIC_KEY}")}"
  key_name = "mykeypair"
}
