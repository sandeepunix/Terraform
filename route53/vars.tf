variable "AWS_REGION" {
  default = "ap-south-1"
}
variable "AWS_PRIVATE_KEY" {
    default = "mykey"
}
variable "AWS_PUBLIC_KEY" {
    default = "mykey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
    ap-south-1 = "ami-5b673c34"
  }
}
