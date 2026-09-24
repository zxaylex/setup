# Update the system
sudo dnf update -y

# Install essential packages
# These are the packages I usually work with, you can add or remove packages as per your requirements
sudo dnf install -y git curl libatomic1 podman podman-compose zsh

# Oh-My-Zsh
# I use Oh My Zsh for managing my zsh configuration.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Language packages
# 1. Python && UV
sudo dnf install -y python3 python3-pip python3-venv
curl -LsSf https://astral.sh/uv/install.sh | sh

# 2. NVM - Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash

# Load NVM 
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Install latest Node.js LTS version
nvm install --lts

# Install pnpm
npm i -g pnpm@latest

# VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
# update package
dnf check-update &&
sudo dnf install code # or code-insiders
