eksctl create iamidentitymapping --cluster ${EKS_CLUSTER_NAME} --arn arn:aws:iam::${AWS_ACCOUNT}:role/${EKS_ROLE_NAME} --username ${K8S_USERNAME}