# Docker and Docker Compose Installation Script

## Overview
This script automates the installation of Docker and Docker Compose on Ubuntu, ensuring a clean setup by removing any conflicting packages before proceeding with the installation.

## Features

- 🚀 Removes conflicting Docker-related packages
- 🔄 Updates package lists and installs necessary dependencies
- 🔑 Adds Docker’s official GPG key and repository
- 🛠 Installs Docker and verifies its installation
- 📦 Installs Docker Compose and configures executable permissions
- 🎨 Provides color-coded output for better visibility

## Requirements

- 🖥 Ubuntu-based system
- 🔑 sudo privileges
- 🌐 Internet connection for downloading Docker packages

## Installation and Usage

### 1. Clone the Repository:

```bash
git clone https://github.com/yourusername/docker-install-script.git
cd docker-install-script
```

### 2. Make the Script Executable:

```bash
chmod +x install_docker.sh
```

### 3. Run the Script:

```bash
./install_docker.sh
```

### 4. Verify the Installation:

To check if Docker is installed and running:

```bash
docker --version
```

To verify Docker Compose:

```bash
docker-compose --version
```

## Notes

- This script **removes any existing Docker-related packages** before installation.
- It installs the **latest stable version** of Docker and Docker Compose.
- If you encounter any issues, check your **internet connection and package sources**.

## License

```bash
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

## Contributing

```bash
Feel free to submit issues or pull requests if you find any improvements or bugs!
```

