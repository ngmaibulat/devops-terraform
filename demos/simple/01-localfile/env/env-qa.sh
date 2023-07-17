terraform workspace new qa

terraform workspace select qa

export TF_VAR_aws_region="us-east-1"

export AWS_PROFILE=qa

alias apply="terraform apply -auto-approve"
