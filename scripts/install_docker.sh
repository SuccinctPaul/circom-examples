
sudo apt-get install build-essential pkg-config cmake clang lldb lld libssl-dev docker-compose

sudo apt-get update
sudo apt-get install docker-compose-plugin # meet error's to see Unbuntu Env
sudo apt install docker-compose-v2
# Docker
## sudo usermod -aG docker YOUR_USER # Add current user to docker group
sudo usermod -aG docker ${USER}

sudo systemctl start docker
