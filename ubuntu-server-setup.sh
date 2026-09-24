# ubuntu-server-setup.sh
# This is usually the first script I run after creating a new Ubuntu server.

# Update Packages
sudo apt update -y
sudo apt upgrade -y

# Install essential packages
sudo apt install build-essential git curl zsh libatomic1 -y

# Oh-My-Zsh
# I use Oh My Zsh for managing my zsh configuration.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Language packages 
# 1. Python && UV (depends when the server hosts a python application)
sudo apt install -y python3 python3-pip python3-venv
curl -LsSf https://astral.sh/uv/install.sh | sh

# 2. NVM - Node Version Manager (depends when the server hosts a python application)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash

# Load NVM 
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Install latest Node.js LTS version
nvm install --lts

# Install pnpm
npm i -g pnpm@latest

# PM2 (This is what I use for managing running services)
npm i -g pm2@latest