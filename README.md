# Terraform with LocalStack

This repository contains a local development environment for AWS services using [LocalStack](https://github.com/localstack/localstack). LocalStack is a platform that emulates a local instance of AWS services, making it easier to develop and test without relying on a real AWS account.

## Features

- Emulation of AWS services in a local environment.
- Configuration of isolated environments for development and testing.
- Avoids costs associated with using real AWS resources.

## Emulated AWS Services

This project uses the following AWS services, emulated by LocalStack:

- **S3**: Object storage.
- **DynamoDB**: NoSQL database.
- **SQS**: Message queue service.
- **Lambda**: Serverless functions.
- **EC2**: Compute instances.

## Prerequisites

- **Docker**: LocalStack runs in Docker containers, so you’ll need Docker installed on your system.
- **AWS CLI**: Optional, for interacting with AWS services in LocalStack.

## Setup

### Container

```bash
docker run --rm -it -p 4566:4566 -p 4571:4571 -d localstack/localstack:latest
```

### Localstack

```bash
provider "aws" {
  region     = "us-east-1"
  access_key = "null"
  secret_key = "null"
  # s3_use_path_style           = false
  # skip_credentials_validation = true
  # skip_metadata_api_check     = true
  # skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    apigatewayv2   = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}
```
