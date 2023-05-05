function awsLogin() {

aws configure set aws_access_key_id $1
aws configure set aws_secret_access_key $2
aws configure set aws_session_token $3
aws configure set region $4
}
function azureLogin() {
az login --service-principal -u $1 -p $2 --tenant $3
}
