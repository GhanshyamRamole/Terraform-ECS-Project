#!/bin/bash

ENV=$1
ACTION=$2

if [[ -z "$ENV" || -z "$ACTION" ]]; then
  echo "Usage: ./run.sh [dev|prod] [plan|apply|destroy]"
  exit 1
fi

cd envs/$ENV || exit 1

terraform init

case "$ACTION" in
  plan)
    terraform plan -var-file=terraform.tfvars
    ;;
  apply)
    terraform apply -var-file=terraform.tfvars -auto-approve
    ;;
  destroy)
    terraform destroy -var-file=terraform.tfvars -auto-approve
    ;;
  *)
    echo "Invalid action. Use: plan, apply, destroy"
    exit 1
    ;;
esac