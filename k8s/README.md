# Kubernetes Manifests for AKS Store Demo

This directory contains separated Kubernetes manifest files for deploying the AKS Store Demo application.

## Kubernetes Resource Definitions

### Deployment
A Deployment manages a set of identical pods, ensuring the specified number of replicas are running. It provides declarative updates, rolling updates, and rollback capabilities. Used for stateless applications.

### StatefulSet
A StatefulSet manages stateful applications, providing stable network identities and persistent storage. Pods are created in order and have predictable names. Used for databases and message queues that require stable identities.

### Service
A Service exposes pods as a network service with a stable IP and DNS name. Types:
- **ClusterIP**: Internal access only (default)
- **LoadBalancer**: External access via cloud provider load balancer
- **NodePort**: Exposes service on each node's IP at a static port

### ConfigMap
Stores non-confidential configuration data as key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or configuration files.

## Architecture Overview

The application consists of three microservices:
- **Store Front**: Web UI (Vue.js)
- **Order Service**: Handles order processing
- **Product Service**: Manages product catalog
- **RabbitMQ**: Message queue for asynchronous order processing

## Manifest Files

### RabbitMQ Components

#### `rabbitmq-configmap.yaml`
ConfigMap that enables RabbitMQ plugins (management UI, Prometheus metrics, AMQP 1.0).

#### `rabbitmq-statefulset.yaml`
StatefulSet for RabbitMQ message broker:
- Runs RabbitMQ 3.10 with management console
- Exposes ports 5672 (AMQP) and 15672 (Management UI)
- Uses default credentials (username/password)
- Resource limits: 250m CPU, 256Mi memory

#### `rabbitmq-service.yaml`
ClusterIP Service exposing RabbitMQ internally on ports 5672 and 15672.

### Order Service Components

#### `order-service-deployment.yaml`
Deployment for the order processing service:
- Connects to RabbitMQ for order queue management
- Exposes port 3000
- Includes health probes (startup, readiness, liveness)
- Init container waits for RabbitMQ availability
- Resource limits: 75m CPU, 128Mi memory

#### `order-service-service.yaml`
ClusterIP Service exposing order-service internally on port 3000.

### Product Service Components

#### `product-service-deployment.yaml`
Deployment for the product catalog service:
- Connects to AI service for product recommendations
- Exposes port 3002
- Includes health probes (readiness, liveness)
- Resource limits: 2m CPU, 20Mi memory

#### `product-service-service.yaml`
ClusterIP Service exposing product-service internally on port 3002.

### Store Front Components

#### `store-front-deployment.yaml`
Deployment for the web frontend:
- Vue.js application serving the UI
- Connects to order-service and product-service
- Exposes port 8080
- Includes health probes (startup, readiness, liveness)
- Resource limits: 1000m CPU, 512Mi memory

#### `store-front-service.yaml`
LoadBalancer Service exposing store-front externally on port 80 (maps to container port 8080).

## Deployment Instructions

### Deploy All Components
```bash
kubectl apply -f k8s/
```

### Deploy in Order (Recommended)
```bash
# 1. Deploy RabbitMQ infrastructure
kubectl apply -f k8s/rabbitmq-configmap.yaml
kubectl apply -f k8s/rabbitmq-statefulset.yaml
kubectl apply -f k8s/rabbitmq-service.yaml

# 2. Deploy backend services
kubectl apply -f k8s/order-service-deployment.yaml
kubectl apply -f k8s/order-service-service.yaml
kubectl apply -f k8s/product-service-deployment.yaml
kubectl apply -f k8s/product-service-service.yaml

# 3. Deploy frontend
kubectl apply -f k8s/store-front-deployment.yaml
kubectl apply -f k8s/store-front-service.yaml
```

### Verify Deployment
```bash
kubectl get pods
kubectl get services
```

### Access the Application
Get the external IP of the store-front service:
```bash
kubectl get service store-front
```

Access the application at `http://<EXTERNAL-IP>`

## Cleanup
```bash
kubectl delete -f k8s/
```

## Notes
- All services use Linux node selectors
- Default RabbitMQ credentials should be changed for production
- LoadBalancer service type requires cloud provider support (works on AKS, EKS, GKE)
