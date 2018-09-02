#!/bin/bash
terraform remote config -backend=s3 -backend-config="bucket=terraform-state-a2b621flala" -backend-config="key=terraform/terraform.tfstate" -backend-config="region=ap-south-1"

