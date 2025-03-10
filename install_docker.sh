#!/bin/bash

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Removing conflicting packages...${NC}"
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt-get remove -y $pkg && echo -e "${GREEN}Removed $pkg${NC}" || echo -e "${RED}Failed to remove $pkg${NC}"
done

echo -e "${YELLOW}Updating package lists...${NC}"
sudo apt-get update && echo -e "${GREEN}Update successful${NC}" || echo -e "${RED}Update failed${NC}"

echo -e "${YELLOW}Installing required packages...${NC}"
sudo apt-get install -y ca-certificates curl && echo -e "${GREEN}Installed required packages${NC}" || echo -e "${RED}Failed to install required packages${NC}"

echo -e "${YELLOW}Adding Docker's GPG key...${NC}"
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && echo -e "${GREEN}GPG key added${NC}" || echo -e "${RED}Failed to add GPG key${NC}"
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo -e "${YELLOW}Adding Docker repository...${NC}"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "${YELLOW}Updating package lists...${NC}"
sudo apt-get update && echo -e "${GREEN}Update successful${NC}" || echo -e "${RED}Update failed${NC}"

echo -e "${YELLOW}Installing Docker...${NC}"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && echo -e "${GREEN}Docker installed successfully${NC}" || echo -e "${RED}Docker installation failed${NC}"

echo -e "${YELLOW}Testing Docker installation...${NC}"
docker --version && echo -e "${GREEN}Docker is installed and working${NC}" || echo -e "${RED}Docker test failed${NC}"

echo -e "${YELLOW}Installing Docker Compose...${NC}"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && echo -e "${GREEN}Docker Compose downloaded${NC}" || echo -e "${RED}Failed to download Docker Compose${NC}"

echo -e "${YELLOW}Setting executable permissions for Docker Compose...${NC}"
sudo chmod +x /usr/local/bin/docker-compose && echo -e "${GREEN}Permissions set${NC}" || echo -e "${RED}Failed to set permissions${NC}"

echo -e "${YELLOW}Creating symbolic link for Docker Compose...${NC}"
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose && echo -e "${GREEN}Symbolic link created${NC}" || echo -e "${RED}Failed to create symbolic link${NC}"

echo -e "${GREEN}Docker and Docker Compose installation completed!${NC}"
