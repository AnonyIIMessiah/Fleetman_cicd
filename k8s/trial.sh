#!/bin/bash
ssh -o "StrictHostKeyChecking no" -i "test.pem" ec2-user@18.213.1.85 "$( cat <<'EOT' 
git clone https://github.com/AnonyIIMessiah/Fleetman_cicd.git
cd Fleetman_cicd/k8s
echo "Applying Changes in YAML file"
kubectl apply -f . 
cd ../..
rm -rf Fleetman_cicd
EOT
)"