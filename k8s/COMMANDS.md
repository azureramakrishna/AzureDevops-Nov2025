# Kubernetes Commands Reference

## Deployment Commands

### Deploy All Resources
```bash
kubectl apply -f k8s/
```

### Deploy Individual Components
```bash
# RabbitMQ
kubectl apply -f k8s/rabbitmq-configmap.yaml
kubectl apply -f k8s/rabbitmq-statefulset.yaml
kubectl apply -f k8s/rabbitmq-service.yaml

# Order Service
kubectl apply -f k8s/order-service-deployment.yaml
kubectl apply -f k8s/order-service-service.yaml

# Product Service
kubectl apply -f k8s/product-service-deployment.yaml
kubectl apply -f k8s/product-service-service.yaml

# Store Front
kubectl apply -f k8s/store-front-deployment.yaml
kubectl apply -f k8s/store-front-service.yaml
```

## Verification Commands

### Check All Resources
```bash
kubectl get all
```

### Check Pods
```bash
kubectl get pods
kubectl get pods -o wide
kubectl get pods --watch
```

### Check Services
```bash
kubectl get services
kubectl get svc
```

### Check Deployments
```bash
kubectl get deployments
kubectl get deploy
```

### Check StatefulSets
```bash
kubectl get statefulsets
kubectl get sts
```

### Check ConfigMaps
```bash
kubectl get configmaps
kubectl get cm
```

## Describe Resources

```bash
kubectl describe pod <pod-name>
kubectl describe service <service-name>
kubectl describe deployment <deployment-name>
kubectl describe statefulset rabbitmq
```

## Logs and Debugging

### View Logs
```bash
kubectl logs <pod-name>
kubectl logs <pod-name> -f  # Follow logs
kubectl logs <pod-name> --tail=100  # Last 100 lines
kubectl logs <pod-name> -c <container-name>  # Specific container
```

### View Previous Container Logs
```bash
kubectl logs <pod-name> --previous
```

### Execute Commands in Pod
```bash
kubectl exec -it <pod-name> -- /bin/sh
kubectl exec -it <pod-name> -- /bin/bash
```

### Port Forwarding
```bash
kubectl port-forward service/store-front 8080:80
kubectl port-forward service/rabbitmq 15672:15672
kubectl port-forward pod/<pod-name> 8080:8080
```

## Scaling

```bash
kubectl scale deployment order-service --replicas=3
kubectl scale deployment product-service --replicas=2
kubectl scale deployment store-front --replicas=3
```

## Update and Rollout

### Update Image
```bash
kubectl set image deployment/order-service order-service=ghcr.io/azure-samples/aks-store-demo/order-service:v2
```

### Rollout Status
```bash
kubectl rollout status deployment/order-service
```

### Rollout History
```bash
kubectl rollout history deployment/order-service
```

### Rollback
```bash
kubectl rollout undo deployment/order-service
kubectl rollout undo deployment/order-service --to-revision=2
```

## Resource Management

### Edit Resources
```bash
kubectl edit deployment order-service
kubectl edit service store-front
```

### Get Resource YAML
```bash
kubectl get deployment order-service -o yaml
kubectl get service store-front -o yaml
```

### Get External IP
```bash
kubectl get service store-front -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

## Monitoring

### Top Commands (requires metrics-server)
```bash
kubectl top nodes
kubectl top pods
kubectl top pod <pod-name>
```

### Events
```bash
kubectl get events
kubectl get events --sort-by=.metadata.creationTimestamp
```

## Cleanup Commands

### Delete All Resources
```bash
kubectl delete -f k8s/
```

### Delete Individual Resources
```bash
kubectl delete deployment order-service
kubectl delete service order-service
kubectl delete statefulset rabbitmq
kubectl delete configmap rabbitmq-enabled-plugins
```

### Delete by Label
```bash
kubectl delete pods -l app=order-service
kubectl delete all -l app=store-front
```

### Force Delete Pod
```bash
kubectl delete pod <pod-name> --force --grace-period=0
```

## Namespace Operations

### Create Namespace
```bash
kubectl create namespace aks-store
```

### Deploy to Specific Namespace
```bash
kubectl apply -f k8s/ -n aks-store
```

### Set Default Namespace
```bash
kubectl config set-context --current --namespace=aks-store
```

### List All Namespaces
```bash
kubectl get namespaces
```

## Troubleshooting

### Check Pod Status
```bash
kubectl get pods --field-selector=status.phase!=Running
```

### Restart Deployment
```bash
kubectl rollout restart deployment/order-service
```

### Check Resource Usage
```bash
kubectl describe nodes
kubectl describe pod <pod-name> | grep -A 5 Resources
```

### Network Debugging
```bash
kubectl run debug --image=busybox -it --rm -- /bin/sh
kubectl run debug --image=nicolaka/netshoot -it --rm -- /bin/bash
```

## Context and Cluster

### View Current Context
```bash
kubectl config current-context
```

### List Contexts
```bash
kubectl config get-contexts
```

### Switch Context
```bash
kubectl config use-context <context-name>
```

### View Cluster Info
```bash
kubectl cluster-info
kubectl version
```
