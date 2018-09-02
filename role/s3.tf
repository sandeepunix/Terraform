resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket-c29df1lala"
  tags {
    name = "my-bucket-sandeep"
  }
}
