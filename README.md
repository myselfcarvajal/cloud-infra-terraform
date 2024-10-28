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

```bash
docker run --rm -it -p 4566:4566 -p 4571:4571 -d localstack/localstack:latest
```
