```bash
export IP=`terraform output -raw public_ip`

rm -f key.pem

terraform output -raw privkey > key.pem
chmod 400 key.pem

terraform show -json > output.json
# reformatted with jq
brew install jq
terraform show -json | jq  > output.json

ssh -i key.pem ubuntu@$IP
```
