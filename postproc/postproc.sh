#! /bin/bash
cd "$(dirname "$0")"

kubectl create namespace ${PROD_NAMESPACE}
./nginx-ingress-controller/install-ingress-controller.sh
./add-role/add-rbac-role.sh