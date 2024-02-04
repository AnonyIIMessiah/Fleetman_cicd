#!/bin/bash
ssh -o "StrictHostKeyChecking no" -i "test.pem" ec2-user@54.208.9.225 "$( cat <<'EOT' 
git clone https://github.com/AnonyIIMessiah/Fleetman_cicd.git
cd Fleetman_cicd/k8s
echo "Applying Changes in YAML file"
kubectl apply -f . 
kubectl set image deployment.apps/webapp webapp=anonymessiah/k8s-fleetmen-webapp-angular:latest
kubectl set image deployment.apps/position-tracker position-tracker=anonymessiah/k8s-fleetmen-position-simulator:latest
kubectl set image deployment.apps/api-gateway api-gateway=anonymessiah/k8s-fleetmen-api-gateway:latest
kubectl set image deployment.apps/position-simulator position-simulator=anonymessiah/k8s-fleetmen-position-simulator:latest

cd ../..
rm -rf Fleetman_cicd
EOT
)"