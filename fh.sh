#!/bin/bash

# Prompt the user to select an option
read -p "Select an option (1 for IPv4, 2 for IPv6): " user_choice

# Function to fetch IP based on user choice
fetch_ip() {
  local choice=$1
  local ip
  if [ "$choice" == "1" ]; then
    echo "Fetching IPv4 address from install.sh..."
    ip=$(echo "1" | bash <(curl -fsSL https://raw.githubusercontent.com/Kolandone/V2/main/installr.sh) | grep -oP '(\d{1,3}\.){3}\d{1,3}:\d+' | head -n 1)
  elif [ "$choice" == "2" ]; then
    echo "Fetching IPv6 address from install.sh..."
    ip=$(echo "2" | bash <(curl -fsSL https://raw.githubusercontent.com/Kolandone/V2/main/installr.sh) | grep -oP '(\[?[a-fA-F\d:]+\]?\:\d+)' | head -n 1)
  fi
  echo "$ip"
}

# Fetch the IP address based on the user's choice
if [ "$user_choice" == "1" ]; then
  ipclean=$(fetch_ip 1)
elif [ "$user_choice" == "2" ]; then
  # First fetch IPv6 address
  ipclean=$(fetch_ip 2)
  
  # Check if a valid IPv6 address was fetched
  if [[ -z "$ipclean" ]]; then
    echo "Failed to fetch a valid IPv6 address. Exiting..."
    exit 1
  fi
  
  # Then fetch IPv4 address and append to ipclean
  ipv4=$(fetch_ip 1)
  
  # Check if a valid IPv4 address was fetched
  if [[ -z "$ipv4" ]]; then
    echo "Failed to fetch a valid IPv4 address. Exiting..."
    exit 1
  fi
  
  # Append the IPv4 address
  ipclean="$ipclean;$ipv4"
else
  echo "Invalid choice. Exiting..."
  exit 1
fi

# Check if we got a valid IP address
if [[ -z "$ipclean" ]]; then
  echo "Failed to fetch a valid IP address. Exiting..."
  exit 1
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
  link="warp://${license}@${ipclean}?ifp=5-10&&detour=warp://${license}@${ipclean}?ifp=5-10"
fi

# Print the result
echo -e "\e[32myoutube:Kolandone\e[0m"
echo "Your hidify config:"
echo "$link"
