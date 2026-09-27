#!/bin/bash
set -e

dnf update -y
dnf install -y docker

systemctl enable docker
systemctl start docker

mkdir -p /opt/webserver

cat > /opt/webserver/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>AWS DevOps Web Server</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <h1>AWS DevOps Web Server</h1>
    <p>Nginx is running in Docker on an AWS EC2 Linux server.</p>
    <p>Provisioned using Terraform.</p>
</body>
</html>
EOF

docker pull nginx:alpine

docker rm -f aws-nginx 2>/dev/null || true

docker run -d \
  --name aws-nginx \
  --restart unless-stopped \
  -p 80:80 \
  -v /opt/webserver/index.html:/usr/share/nginx/html/index.html:ro \
  nginx:alpine
