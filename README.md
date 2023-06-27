## Installation Instructions

- Log into workspace
- Open terminal
- Set keyboard map, default is US - may be important if you have symbols in your password
    - `setxkbmap gb` for UK layout
- `wget https://raw.githubusercontent.com/brabster/al2-datasci-setup/main/setup.sh` to download the setup script to your home directory
- `chmod 775 setup.sh` to make the script executable
- `./setup.sh` to install the course software
- You will need to log out and back in again to use Docker (System -> Log Out)

## Workspaces Infrastructure

A [CloudFormation template](infrastructure_example/workspaces.yml) is provided to bootstrap a VPC, SimpleAD Directory and permissions for running workspaces.
In a real implementation some alterations may be needed, for example to deploy into an existing VPC and re-use existing NAT Gateways rather than pay for new ones.

