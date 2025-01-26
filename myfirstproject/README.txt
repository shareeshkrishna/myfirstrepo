Steps to Complete the Project:

1.Set Up a Linux Environment

2.Use a virtual machine (e.g., VirtualBox), cloud platform (e.g., AWS free tier), or your local Linux setup.
3.Install a Linux distribution like Ubuntu or CentOS.
4.Install Required Tools
5.Update the system:

sudo apt update && sudo apt upgrade -y  # For Ubuntu

6.Install Nginx:

   sudo apt install nginx -y  # For Ubuntu

7.Create a Sample Web Application

   Prepare a static HTML file (e.g., index.html) with a simple "Hello, World" message.
   Place it in /var/www/html or another directory of your choice.

8.Configure Nginx

   Modify the Nginx configuration file to serve the static site:

   sudo vim /etc/nginx/sites-available/default  # For Ubuntu

9.Add the configuration:

    server {
       listen 80;
       server_name localhost;

       root /var/www/html;
       index index.html; }
                         
10.Restart Nginx:

    sudo systemctl restart nginx

11.Write an Automation Script

    Create a Bash script to automate:
    Installation of Nginx
    Placement of the web app files
    Configuration of Nginx

    Bash script:

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

12.Test Your Deployment

    Access the website using your Linux server's IP address in a browser:

    http://<your-server-ip>

