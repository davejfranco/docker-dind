# Docker dind (Docker inside docker) + AWSCLI

Based on the official docker:dind image + pip and awscli tool to manage resources on the cloud.

## Why?
This container is meant to be use with CI/CD on gitlab or any other similar tool, when building containers is part of the process and deployment requires AWS

## Instructions

You can either pull the image from ```docker pull davejfranco/dind``` or build it yourself ```docker build -t davejfranco/dind .``` 

Because the container has awscli installed, to automatically configure awscli 

```
docker run --name dockerdind -d -e "AWS_ACCESS_KEY=xxxxxxxx" \
-e "AWS_SECRET_KEY=xxxxxxxxxxx" \
-e "AWS_OUTPUT=json" \
-e "AWS_DEFAULT_REGION=us-east-1 davejfranco/dind 
```

Note:

AWS_ACCESS_KEY and AWS_SECRET_KEY variables are require while AWS_OUTPUT and AWS_DEFAULT_REGION no; default values will be json and us-east-1 respectively