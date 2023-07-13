```bash
export IP=`terraform output -raw public_ip`

rm -f key.pem

terraform output -raw privkey > key.pem
chmod 400 key.pem

ssh -i key.pem ubuntu@$IP
```
