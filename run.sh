#!/bin/bash

minikube start --driver=docker --memory=4096

sudo curl -L https://istio.io/downloadIstio | sh -
cd istio-*
export PATH=$PWD/bin:$PATH
cd ..

istioctl manifest apply --set profile=demo -y
istioctl install --set profile=demo --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY -y


kubectl label namespace default istio-injection=enabled
echo "catfact:"
kubectl apply -f catfact.yaml
echo "ingress:"
kubectl apply -f ingress.yaml
echo "egress:"
kubectl apply -f egress.yaml
echo "nginx:"
kubectl apply -f nginx.yaml
minikube tunnel
