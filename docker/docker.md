Docker installation on ubuntu:
=============================

https://docs.docker.com/engine/install/ubuntu/

Install using the apt repository:
================================

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

# To install the latest version, run:
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# verify docker

docker --version



- create a image from container
- how to push image to docker hub 
- how to create image from dockerfile



🚀 Docker Commands – Notes (Based on Your History)
1. Downloading Images
Command	Purpose
docker pull ubuntu	Pulls the latest Ubuntu image from Docker Hub.
docker pull ubuntu:22.04	Pulls a specific Ubuntu version (22.04).
docker pull mcr.microsoft.com/windows:ltsc2019	Attempts to pull a Windows-based image (fails on Linux).

2. Listing Images
Command	Purpose
docker images	Shows all downloaded container images.

3. Running Containers
Command	Purpose
docker run ubuntu	Runs Ubuntu container (non-interactive, exits immediately).
docker run ubuntu:22.04	Runs Ubuntu 22.04 container.
docker run --name saanvikit -itd ubuntu:22.04	Runs container in background with a name (saanvikit).
docker run --name demo -it ubuntu	Runs interactive container with terminal access.
docker run --name test ubuntu:latest	Runs Ubuntu container with name test.
docker run --name test1 -itd ubuntu:latest	Starts Ubuntu container in detached mode.
docker run --name test2 -it ubuntu-custom:latest	Runs a container using your custom image.

4. Viewing Containers
Command	Purpose
docker ps	Lists running containers.
docker ps -a	Lists all containers, including stopped ones.

5. Attaching to Containers
Command	Purpose
docker attach test1	Attach to the running container named test1.
docker attach 17ef	Attach to container using partial container ID (17ef).

6. Creating Custom Images
Command	Purpose
docker commit test1 ubuntu-custom	Creates a new image named ubuntu-custom from container test1.

7. Tagging Images
Command	Purpose
docker tag ubuntu-custom:latest saanvikit/ubuntu-custom:1.0	Tags your custom image for Docker Hub (username/repository:tag).

8. Logging in to Docker Hub
Command	Purpose
docker login	Logs in to Docker Hub for pushing images.

9. Pushing Images to Docker Hub
Command	Purpose
docker push saanvikit/ubuntu-custom:1.0	Uploads your custom image to Docker Hub.

10. Inspecting Images
Command	Purpose
docker inspect saanvikit/ubuntu-custom:1.0	Shows detailed metadata about the image.

11. Removing Images
Command	Purpose
docker rmi saanvikit/ubuntu-custom:1.0	Removes the image locally.

12. Create a docker image from dockerfile

create dockerfile 
docker build -t ubuntu:1.0 .



Lab:

https://learn.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-app

https://learn.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-acr

https://learn.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-deploy-app