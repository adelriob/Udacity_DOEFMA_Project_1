Created 10/02/2021
# Deploying a Web Server in Azure. 

## Introduction
In this project, I will develop the solution to the case raised with the following tools: Terraform, Packer and Azure

## Getting Started
Before starting, you must have the following tools installed on an Ubuntu 20.04 linux machine:
* Terraform

Install Terraform

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt install terraform
```

* Packer

Install Packer

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update -y && sudo apt-get install packer
```

* AZ Cli

Install Packer

```
sudo apt-get update -y

sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-get update -y

sudo apt-get install azure-cli
```

## Instructions

Enter the environment by command line:
```
az login --use-device-code
```

Create and assign the policy definitition:
```
az policy definition create --name tagging-policy --mode indexed --rules policy-tags.json

az policy assignment create --policy tagging-policy --name tagging-policy
```

Create resource group:

```
az group create -n udacity-project-1-rg -l eastus
```

Create service principal

```
az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
```

Clone repository to work:

```
git clone https://github.com/adelriob/Udacity_DOEFMA_Project_1.git

```

Go to Repository:

```
cd Udacity_DOEFMA_Project_1
```



Create the environment.sh file that will contain the necessary data for the creation of the IaC, it must contain the following:
```
export ARM_CLIENT_ID=appId
export ARM_CLIENT_SECRET=password
export ARM_SUBSCRIPTION_ID=suscription
export ARM_TENANT_ID=tenant
```

Run environment:
```
source environment.sh
```

Create image with Packer:

```
packer build server.json
```

Work with terraform:

(you can customize the process by modifying the variables.tf file)

```
#Initialize terraform
terraform init

#Planing terraform
terraform plan -out solution.plan

#Apply terraform
terraform apply -auto-approve
```

You can destroy your resources:

```
terraform destroy -auto-approve

az group delete -n udacity-project-1-rg
```