### Highly scalable, high availability stock market server cloud infrastructure with real-time data handling and 500+ strategy computations for 1 min long candles
![Stock Market Architecture on Github](https://github.com/user-attachments/assets/219721c7-bb83-4e6d-a1c8-309cc51bf2e7)
# Prerequisites
Get Terraform installed
Download and install from: https://www.terraform.io/downloads.html

Cloud provider CLI
(e.g., AWS CLI, Azure CLI, or GCP SDK) installed and configured.

Access to the GitHub repo with Terraform files.

# Step-by-Step Instructions
## 1. Clone the Repository
git clone https://github.com/piyush-c04/terraform-stockserver.git  
cd src  
## 2. Create Your Own terraform.tfvars File  
cp terraform.tfvars.example terraform.tfvars  
Edit the terraform.tfvars file with your specific values:  
region       = "us-east-1"  
instance_type = "t2.micro"  
project_name = "my-terraform-project"  

## 3. Initialize Terraform
Run this command to download the required providers and modules.  
terraform init  

## 4. Review the Execution Plan
This will show you what Terraform plans to do.  
terraform plan -var-file="terraform.tfvars"  

## 5. Apply the Terraform Configuration  
This step will provision infrastructure on your cloud provider.  
terraform apply -var-file="terraform.tfvars"  

### Type yes when prompted to confirm  

## 6. Destroy the Resources (Optional)  
If you want to clean up the provisioned resources:  
terraform destroy -var-file="terraform.tfvars"  

# Notes  
Do not commit secrets or terraform.tfvars to version control.  

Use backend.tf if you're using remote state (like S3 or Terraform Cloud).  

You can use .env files and environment variables if your provider credentials are sensitive.  

For teams: consider using a workspace (terraform workspace) for environment separation.  
