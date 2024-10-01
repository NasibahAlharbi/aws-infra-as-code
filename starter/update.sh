# Recive argu.
STACK_NAME=$1
TEMPLETE=$2
PARAMETER=$3
aws cloudformation update-stack --stack-name $STACK_NAME --template-body file://$TEMPLETE --parameters file://$PARAMETER --capabilities CAPABILITY_NAMED_IAM  --region us-east-1