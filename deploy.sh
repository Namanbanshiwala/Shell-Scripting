#!/bin/bash

# Deploy a Django app and handle errors

# Function to clone the Django app code
code_clone(){ 
	echo "clonning the code"
       	git clone https://github.com/LondheShubham153/django-notes-app.git } 

install_requirment(){ 
	sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose 
}

require_restart(){ 
	sudo chown "$USER" /var/run/docker.sock 
	sudo systemctl enable docker 
	sudo systemctl enable nginx 
	sudo systemctl restart docker }
      	
deploy(){ 
	docker build -t notes-app . 
	docker run -d -p 8000:8000 notes-app:latest
}
if ! code clone; then 
	echo "code is already exist" 
	cd django-notes-app 
fi
