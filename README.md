# AWS DevOps Web Server

A beginner-friendly AWS DevOps project that provisions an EC2-based Linux web server with Terraform, runs Nginx in Docker, and validates the Terraform configuration through GitHub Actions.

## Architecture

```text
Developer
   |
   | Git push
   v
GitHub Repository
   |
   +---- GitHub Actions ----> Terraform fmt / init / validate
   |
   v
Terraform
   |
   v
AWS EC2 (Amazon Linux)
   |
   v
Docker
   |
   v
Nginx Web Server
   |
   v
HTTP :80
```

## Technologies

- AWS EC2
- AWS Security Group
- Terraform
- Linux
- Bash
- Docker
- Nginx
- Git / GitHub
- GitHub Actions

## Project Structure

```text
aws-devops-web-server/
├── .github/
│   └── workflows/
│       └── terraform.yml
├── app/
│   └── index.html
├── scripts/
│   └── user_data.sh
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   └── terraform.tfvars.example
├── .gitignore
├── Dockerfile
└── README.md
```

## What the project does

1. Creates an AWS EC2 instance using Terraform.
2. Creates a security group allowing SSH and HTTP access.
3. Uses EC2 user data to install and start Docker.
4. Builds an Nginx Docker container serving a custom HTML page.
5. Exposes the website on port 80.
6. Uses GitHub Actions to run Terraform formatting, initialization, and validation.

## Prerequisites

Install:

- AWS CLI
- Terraform
- Git
- An AWS account

Configure AWS credentials locally using:

```bash
aws configure
```

Do not commit AWS access keys, private keys, `.tfstate` files, or secrets to GitHub.

## Deploy

Go to the Terraform directory:

```bash
cd terraform
```

Copy the example variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit the values in `terraform.tfvars`.

Then run:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

After deployment:

```bash
terraform output
```

Open the displayed public IP in a browser:

```text
http://<EC2_PUBLIC_IP>
```

## Destroy Resources

When finished, remove the AWS resources to avoid unnecessary charges:

```bash
terraform destroy
```

## GitHub Actions

The workflow in `.github/workflows/terraform.yml` automatically checks:

- Terraform formatting
- Terraform initialization
- Terraform validation

This project intentionally keeps AWS deployment credentials out of GitHub Actions. The workflow is a safe CI validation pipeline.

## Security Notes

This demo opens SSH (`22`) to the internet. For a real production deployment, restrict SSH to your own IP or use AWS Systems Manager instead.

Never upload:

- AWS access keys
- `.pem` private keys
- `terraform.tfstate`
- `terraform.tfstate.backup`
- `.terraform/`

## Resume Description

**AWS Linux Web Server Deployment | Terraform, EC2, Docker, Nginx, GitHub Actions**

Provisioned an AWS EC2 Linux web server using Terraform, configured Docker and Nginx through EC2 user data, implemented security-group rules for SSH/HTTP access, and added GitHub Actions for Terraform formatting and validation.
