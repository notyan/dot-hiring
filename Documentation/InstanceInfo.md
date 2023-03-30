# Informasi instance dan langkah pembuatan instance

## Instance Information
The Instance are built using this configuration
```
Region: us-central1-c
Type: e2-micro
OS: Ubuntu 22.04 LTS
Disk: 25 GB
```

## Instance Creation
The instance are created on Google Cloud Platform using Terraform

1.  ```cd terraform``` to change the current directory into terraform folder
2.  Configure listed variable inside the `variable.tf` and customize as your need 
    - `project_id` for the project id
    - `ssh_public_key`  for the ssh pulic key  to acces compute engine instance
    - `ssh_user` for ssh user to access compute engine instance
    - `ceSA` Compute engine Service Account for IAM Configuration
3. ```terraform apply``` to apply the configuration
4. Wait until terraform finish the execution
5. After terraform finish execution it will create/configure this resource

    - Google compute engine instance
    - VPC
    - Static ip
    - Google Cloud Storage bucket
    - Configure the IAM Permission