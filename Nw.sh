#!/bin/bash

# Check if ipclean is set
if [[ -z "$ipclean" ]]; then
  echo "ipclean is not set. Installing..."
  bash <(curl -fsSL https://raw.githubusercontent.com/Ptechgithub/warp/main/endip/install.sh)
  # User should manually select option 1 during the installation process
fi

# Prompt user for warp clean IP and port if not set
if [[ -z "$ipclean" ]]; then
  read -p "Insert your warp clean IP and port: " ipclean
fi

# Prompt user for license
read -p "Insert your license: " license

# Generate links based on the provided information
if [[ -z "$license" ]]; then
  link="warp://${ipclean}?ifp=5-10&&detour=warp://${ipclean}?ifp=5-10"
else
  link="warp://${license}@${ipclean}?ifp=5-10&&detour=warp://${ipclean}?ifp=5-10"
fi

# Print the result
echo "Your hidify config:"
echo "$link"
