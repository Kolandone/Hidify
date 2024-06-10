#!/bin/bash

# Check if ipclean is set
if [[ -z "$ipclean" ]]; then
  echo "ipclean is not set. Installing..."
  # The following line will install the script and should automatically select option 1
  ipclean=$(echo "1" | bash <(curl -fsSL https://raw.githubusercontent.com/Ptechgithub/warp/main/endip/install.sh) | grep -oP '(\d{1,3}\.){3}\d{1,3}:\d+' | head -n 1)
  
  # Check if a valid IP and port were fetched
  if [[ -z "$ipclean" ]]; then
    echo "Failed to fetch a valid IP and port. Exiting..."
    exit 1
  fi
fi

# Prompt user for warp clean IP and port if not set by the install script
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
echo -e "\e[32myoutube:Kolandone\e[0m"
echo "Your hidify config:"
echo "$link"
