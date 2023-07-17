terraform workspace new prod

terraform workspace select prod

export TF_VAR_aws_region="us-east-1"

export AWS_PROFILE=prod

alias apply="terraform apply -auto-approve"
