# Konfigurasi CI/CD dan hasil uji

Gitlab Link : `https://gitlab.com/defaroyan/dot-cms-contentfull/`

## Project Variable
Project variable are needed to run the workflow. The needed variable is listed below
1. `CI_REGISTRY` is the link for the Container registry
2. `CI_REGISTRY_PASSWORD` The registry password for authentication
3. `CI_REGISTRY_USER` The registry user for authentication
4. `SSH_PRIVATE_KEY` SSH private key to be used inside ansible-playbook
5. `TARGET_HOST` The target host for ansible-playbook

## Workflow files

CI/CD pipeline are created using gitlab CI/CD the new file other than app is 

1.  `.gitlab-ci.yml`

This file is the gitlab-ci-cd workflow that will be triggered everytime there is new code in the `main` branch.

This workflow consist of three stages 
    
- `build stage` Is the stage to build the repository using `Dockerfile` and save it as `dot-cms.tar` then put it in the artifact
- `push stage` This is the stage where the `dot-cms.tar` loaded then will be tagged and push into gitlab-container
- `deploy stage` On this stage the app are deployed using ansible playbook `deploy.yml`. Before running the playbok, it needs to set the sh private key so the agent can communicate with target vm

2. `Dockerfile`
Used to build the repository into docker images. Inside the DOckerfile it will install dependencies and build the application then expose to specific port

3. `inventory.yml`
The list of host that ansible need to run the playbook.

4. `deploy.yml`
Consist three task to deploy the application, it started by install python docker module, pulling the image than run the docker images on specific port