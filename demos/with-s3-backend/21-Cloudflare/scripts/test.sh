#!/bin/bash

# set -e

# set vars

export AWS_PAGER=""
export AWS_ACCESS_KEY_ID=`terraform output -raw access_key_id`
export AWS_SECRET_ACCESS_KEY=`terraform output -raw secret_access_key`


# perform tests

echo "\n\nTesting access - should succeed:\n"
aws s3 ls

echo "\n\nTesting access - should fail:"
aws sns list-topics
echo "\n\n"

# unset vars to allow normal access level

unset AWS_PROFILE
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
