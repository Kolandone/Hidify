#!/bin/bash

# Prompt the user to select IPv4 or IPv6
read -p "Select an option (1 for IPv4, 2 for IPv6): " user_choice

# Check if ipclean is set
if [[ -z "$ipclean" ]]; then
  echo "ipclean is not set. Installing..."

  # Fetch IP based on the user's choice
  if [ "$user_choice" == "1" ]; then
    echo "Fetching IPv4 address from install.sh..."
    fetched_ip=$(echo "1" | bash <(curl -fsSL https://raw.githubusercontent.com/Ptechgithub/warp/main/endip/install.sh) | grep -oP '(\d{1,3}\.){3}\d{1,3}:\d+' | head -n 1)
  elif [ "$user_choice" == "2" ]; then
    echo "Fetching IPv6 address from install.sh..."
    fetched_ip=$(echo "2" | bash <(curl -fsSL https://raw.githubusercontent.com/Ptechgithub/warp/main/endip/install.sh) | grep -oP '(\[?[a-fA-F\d:]+\]?\:\d+)' | head -n 1)
  else
    echo "Invalid choice. Exiting..."
    exit 1
  fi

  # Check if a valid IP and port were fetched
  if [[ -z "$fetched_ip" ]]; then
    echo "Failed to fetch a valid IP and port. Exiting..."
    exit 1
  fi

  ipclean=$fetched_ip
fi

# Prompt user for warp clean IP and port if not set by the install script
if [[ -z "$ipclean" ]]; then
  read -p "Insert your warp clean IP and port: " ipclean
fi

# Prompt user for license
read -p "Insert your license: " license

# Generate links based on the provided information
if [[ -z "$license" ]]; then
  link="warp://${ipclean}?ifp=5-10#Iran&&detour=warp://${ipclean}?ifp=5-10#Germany"
else
  link="warp://${license}@${ipclean}?ifp=5-10#Iran&&detour=warp://${ipclean}?ifp=5-10#Germany"
fi

# Print the result
echo -e "\e[32myoutube:Kolandone\e[0m"
echo "Your hidify config:"
echo "$link"
