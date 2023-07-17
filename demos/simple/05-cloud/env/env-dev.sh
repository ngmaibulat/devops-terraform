terraform workspace new dev

terraform workspace select dev

export TF_VAR_aws_region="us-east-1"

export AWS_PROFILE=dev

alias apply="terraform apply -auto-approve -var-file=env/dev.tfvars"

alias destroy="terraform destroy -auto-approve -var-file=env/dev.tfvars"

alias plan="terraform plan -var-file=env/dev.tfvars"

alias tf="terraform"

alias branch="git rev-parse --abbrev-ref HEAD"

# bat
# jq
# nc -vz host port
