Make sure to open port for Nodeport (30000-32000) and for pod(5000)
- aws ec2 authorize-security-group-ingress --group-id <security-group-id> --protocol tcp --port 5000 --cidr 0.0.0.0/0
- aws ec2 authorize-security-group-ingress --group-id <security-group-id> --protocol tcp --port <your-node-port> --cidr 0.0.0.0/0
