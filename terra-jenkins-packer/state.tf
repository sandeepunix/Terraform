terraform {
  backend "s3" {
    bucket = "terraform-state-a2b621flala"
    key    = "terraform/jenkin"
    region = "ap-south-1"
  }
}

