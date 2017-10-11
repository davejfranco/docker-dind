#!/bin/sh

if [[ -z $AWS_ACCESS_KEY ]] || [[ -z $AWS_SECRET_KEY ]]; then
  echo "aws environment variables credentials are empty"
  exit 1
fi

mkdir /root/.aws
cat > /root/.aws/credentials << EOF
[default]
aws_access_key_id = $AWS_ACCESS_KEY
aws_secret_access_key = $AWS_SECRET_KEY
EOF

if [ -z $AWS_OUTPUT ]; then
  AWS_OUTPUT="json"
fi


if [ -z $AWS_DEFAULT_REGION ]; then
  AWS_DEFAULT_REGION="us-east-1"
fi

cat > /root/.aws/config << EOF
[default]
output = $AWS_OUTPUT
region = $AWS_DEFAULT_REGION
EOF

#Execute dockerd
dockerd-entrypoint.sh
