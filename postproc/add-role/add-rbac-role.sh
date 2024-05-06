#!/bin/bash

cd "$(dirname "$0")"

eksctl create iamidentitymapping --cluster ${EKS_CLUSTER_NAME} \
    --arn ${EKS_ROLE_ARN} --username ${K8S_USERNAME}

helm upgrade --install --atomic \
    --set username=${K8S_USERNAME} \
    --set namespace=${PROD_NAMESPACE}\
    ${PROD_NAMESPACE}-rbac ./rbac/.
