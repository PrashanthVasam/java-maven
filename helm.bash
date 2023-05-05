function awsLogin() {

aws configure set aws_access_key_id $1
aws configure set aws_secret_access_key $2
aws configure set aws_session_token $3
aws configure set region $4
}
function azureLogin() {
az login --service-principal -u $1 -p $2 --tenant $3
}
function helmpush{
az acr login --name TOTEMTEST
helm pull oci://totemtest.azurecr.io/helm/msa-dev-helm --version 0.1.0
pwd
ls
aws ecr get-login-password --region us-east-1 | helm registry login --username AWS --password-stdin 554487920627.dkr.ecr.us-east-1.amazonaws.com
helm push /home/runner/work/java-maven/java-maven/msa-dev-helm-0.1.0.tgz oci://554487920627.dkr.ecr.us-east-1.amazonaws.com/
}
