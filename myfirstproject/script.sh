#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing Nginx..."
sudo apt install nginx -y

echo "Creating web application..."
sudo mkdir -p /var/www/html
echo "<h1>Hello, World from DevOps!</h1>" | sudo tee /var/www/html/index.html

echo "Configuring Nginx..."
sudo bash -c 'cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80;
    server_name localhost;

    root /var/www/html;
    index index.html;
}
EOF'

echo "Restarting Nginx..."
sudo systemctl restart nginx

echo "Web application deployed successfully!"
