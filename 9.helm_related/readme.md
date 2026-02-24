## NOTE for helm 

Helm -> package manager for kubernetes 
fish -> sudo apt update , sudo apt install fish -y 
Used for: 
 - Deploy services 
 - for more complicated ( microservices )
 - database cluster , monitoring tools 
 - multiple clusters , multiple environments 


ex. 
Kubernetes 
    - Prod
        - configuration for prod  
    - Dev: 
        - configuration for dev 
    - Stagging
        - configuration for stagging  
Rollback to a specific revision id 
1 2 3 4 5 
you can rollback to specific revision id , which record when you deploy your service 

**Helm** -> store your own helm configuration( helm chart ) inside your private registry ( git,  nexusoss )

Helm + Kustomize(yaml multiple layer approach )

```bash 
# command to create helm chart
helm create nginx-chart 
helm template nginx-chart 
# must be inside the location where you store the chart 
helm install nginx-release nginx-chart

# after modified the confiugration in the values.yaml 
# in order to upgrade your release 
helm upgrade nginx-release nginx-chart \
        --description "update the earthdx instead " 

# if it doesn't exist, it will install the new release 
# if it's already exists, it will upgrade instead 
helm upgrade nginx-release nginx-chart --install 
helm history nginx-release # to show the timestamp for the update and revision id 

helm rollback nginx-release <revision-number> 
helm rollback nginx-release 3 


# to package your chart 
helm package nginx-chart 
# you will get the zipped .tgz which later on can be pushed to your registry (nexusoss)
helm upgrade nginx-release nginx-chart \
    --values location-to-value.yaml --install 
```

*** 
## Customizing the helm chart 