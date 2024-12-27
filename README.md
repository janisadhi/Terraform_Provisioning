# Terraform AWS Resources Setup

This repository contains Terraform code to provision an EC2 instance and a security group on AWS. The security group allows inbound traffic on ports 22 (SSH), 80 (HTTP), and 443 (HTTPS). The EC2 instance is configured to use a specific Amazon Machine Image (AMI) and is set to the `t2.micro` instance type.



---

## Requirements

- Terraform version >= 1.4.0
- AWS provider version >= 5.0

Make sure to install Terraform and AWS CLI (if not already done) to be able to use the configurations.

## Setup

1. **Clone this repository:**
   ```
   git clone https://github.com/janisadhi/Terraform_Provisioning
   cd Terraform_Provisioning
   ```

2. **Configure AWS CLI:**
   If you haven't already configured your AWS credentials, run the following command:
   ```
   aws configure
   ```
   Follow the prompts to provide your AWS Access Key ID, Secret Access Key, and region.

3. **Initialize Terraform:**
   Initialize your Terraform environment by running:
   ```
   terraform init
   ```

4. **Apply the Configuration:**
   Once initialization is complete, apply the Terraform configuration to create the resources:
   ```
   terraform apply
   ```
   Terraform will ask for confirmation before proceeding. Type `yes` to proceed.

5. **Resources Created:**
   - **EC2 Instance:** A `t2.micro` EC2 instance will be created using the specified AMI (`ami-0453ec754f44f9a4a`).
   - **Security Group:** A security group with the name `terraform_group` will be created, allowing SSH (port 22), HTTP (port 80), and HTTPS (port 443) traffic.

6. **Verify the Resources:**
   After applying, you can log into the AWS Console and check the EC2 instance and security group created under the specified region (`us-east-1`).

## Resources

- **AWS EC2 Instance:** `aws_instance.first_instance`
- **AWS Security Group:** `aws_security_group.demo_security_group`

## Code Explanation

### `terraform` Block:
This block specifies the required Terraform provider (`aws`) and its version as well as the required Terraform version.

### Provider Block:
Configures the AWS provider with the region set to `us-east-1`.

### EC2 Instance:
- **AMI:** The EC2 instance uses a specific AMI (`ami-0453ec754f44f9a4a`).
- **Instance Type:** The instance type is `t2.micro`, which is eligible for the AWS free tier.
- **Tags:** The instance is tagged with `Name = "awsLinux"`.

### Security Group:
- The security group `terraform_group` is created with inbound rules for:
  - SSH (port 22)
  - HTTP (port 80)
  - HTTPS (port 443)

## Cleanup

To delete the resources created by this Terraform configuration, run:
```
terraform destroy
```
Terraform will prompt you for confirmation before deleting the resources.

---

