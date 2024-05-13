
## Infrastructure  
### Requirements 
- AWS account
    - AWS user with resource creation permission
        - EKS
        - EC2
        - VPC
        - S3
    - Separate IAM user for deploying kubernetes
        - User role with sts:AssumeRole permission
    - S3 Buckets
        - For site images. (Public access)
        - For Terraform state sorage
    - EBS
        - For Grafana PV
        - For Prometheus PV
- AWS CLI
- Terraform
- Helm

### Resorces
-   <a href= https://github.com/s-pepyako/infra/tree/main/terraform> Terraform configuration</a>  
-   <a href= https://github.com/s-pepyako/infra/tree/main/postproc> Cluster post-processing resources</a>
-   <a href= https://github.com/s-pepyako/infra/tree/main/monitoring> Monitoring manifests</a>

### Deployment

#### Cluster
```bash
# Login as AWS administrator
aws configure

# Deploy the cluster
cd ./terraform
terraform apply -auto-approve
# Add kubeconfig for the new cluster
./add_kubeconfig.sh


# Deploy ingress-nginx controller and add rbac role for deployment
cd ../postproc
./postproc.sh

```
#### DNS
```
Add CNAME records for the site and monitoring to the load balancer URL
```

#### Monitoring
```
Install charts from ./monitoring
```