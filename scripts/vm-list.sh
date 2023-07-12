export AWS_DEFAULT_REGION=eu-central-1
export FMT='Reservations[*].Instances[*].[InstanceId,State.Name,PrivateIpAddress,PublicIpAddress,InstanceType]'

aws ec2 describe-instances  \
            --query $FMT \
            --output table \
            --region $AWS_DEFAULT_REGION
