#!/bin/bash

aws configure set aws_access_key_id "${{ secrets.AWS_ACCESS_KEY_ID }}"
aws configure set aws_secret_access_key "${{ secrets.AWS_SECRET_ACCESS_KEY }}"
aws configure set aws_session_token "${{ secrets.AWS_SESSION_TOKEN }}"
aws configure set region "${{ secrets.AWS_REGION }}"
az login --service-principal -u ${{ secrets.AZURE_CLIENTID }} -p ${{ secrets.AZURE_CRED }} --tenant ${{ secrets.AZURE_TENANTID }}

az acr login --name TOTEMTEST
helm pull oci://totemtest.azurecr.io/helm/msa-dev-helm --version 0.1.0
pwd
ls
aws ecr get-login-password --region us-east-1 | helm registry login --username AWS --password-stdin 554487920627.dkr.ecr.us-east-1.amazonaws.com
helm push /home/runner/work/java-maven/java-maven/msa-dev-helm-0.1.0.tgz oci://554487920627.dkr.ecr.us-east-1.amazonaws.com/
