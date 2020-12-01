#!/bin/bash
#
kubectl apply -f e.yaml
helm repo add elastic https://helm.elastic.co
helm repo add fluent https://fluent.github.io/helm-charts
helm repo update
helm install elasticsearch elastic/elasticsearch --version=7.9.0 --namespace=test
helm install fluent-bit fluent/fluent-bit --namespace=test
helm install kibana elastic/kibana --version=7.9.0 --namespace=test --set service.type=NodePort
kubectl run random-logger --image=chentex/random-logger -n test
#kubectl apply -f ingress.yaml -n test
