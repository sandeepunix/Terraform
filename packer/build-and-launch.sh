/usr/local/packer build -machine-readable packer-example.json| tee build.log
AMI_ID=`egrep -oe 'ami-.{17}' build.log |tail -n1`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
terraform init "-lock=false"
terraform apply "-lock=false"

