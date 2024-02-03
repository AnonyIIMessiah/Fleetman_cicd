#!/bin/bash
ssh -o "StrictHostKeyChecking no" -i "test.pem" ec2-user@18.213.1.85 "$( cat <<'EOT' 
mkdir working
cd fleetman
echo "Applying Changes in YAML file"
'kubectl' apply -f . 
whoami
EOT
)"