

export AWS_DEFAULT_REGION=eu-central-1
export KEY_NAME=sshkey
export KEY_PATH=~/.ssh/id_rsa.pub

aws ec2 import-key-pair --key-name $KEY_NAME --public-key-material fileb://~/.ssh/id_rsa.pub

aws ec2 describe-key-pairs --key-name $KEY_NAME
