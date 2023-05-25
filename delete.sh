#!/bin/bash

kubectl delete deployment catfact-deployment nginx-deployment-service
kubectl delete se service-entry-catfact
kubectl delete vs catfact-vs-egress catfact-vs-ingress
kubectl delete cm nginx-deployment-cm
kubectl delete svc catfact-service-cip nginx-service-cip
kubectl delete gateway catfact-egressgateway catfact-ingress-gateway
kubectl delete destinationrule catfact-destrule
kubectl label namespace default istio-injection=disabled

cd istio-*
export PATH=$PWD/bin:$PATH
istioctl manifest generate --set profile=demo | kubectl delete -f -
cd ..
rm -fr istio-*

minikube delete
