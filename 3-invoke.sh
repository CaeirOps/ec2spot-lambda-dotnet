#!/bin/bash
set -eo pipefail
#FUNCTION=$(aws cloudformation describe-stack-resource --stack-name ec2-spot --logical-resource-id function --query 'StackResourceDetail.PhysicalResourceId' --output text)

COUNTER=0
while [  $COUNTER -lt 3 ]; do
  aws lambda invoke --function-name lambda-dev-test --region us-east-1 --payload '{"key": "value"}' out.json
  cat out.json
  echo ""
  sleep 2
  let COUNTER=COUNTER+1
done
