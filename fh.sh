#!/bin/bash

# Prompt the user to select an option
read -p "Select an option (1 for IPv4, 2 for IPv6): " user_choice

# Function to fetch IP based on user choice
fetch_ip() {
  local choice=$1
  local ip
  if [ "$choice" == "1" ]; then
    ip=$(echo "1" | bash <(curl -fsSL https://raw.githubusercontent.com/Kolandone/V2/main/installr.sh) | grep -oP '(\d{1,3}\.){3}\d{1,3}:\d+' | head -n 1)
  elif [ "$choice" == "2" ]; then
    ip=$(echo "2" | bash <(curl -fsSL https://raw.githubusercontent.com/Kolandone/V2/main/installr.sh) | grep -oP '(\[?[a-fA-F\d:]+\]?\:\d+)' | head -n 1)
  fi
  echo "$ip"
}

# Initialize variables
ipv4=""
ipv6=""

# Fetch the IP address based on the user's choice
if [ "$user_choice" == "1" ]; then
  ipv4=$(fetch_ip 1)
  echo "Fetched IPv4 address: $ipv4"
elif [ "$user_choice" == "2" ]; then
  # First fetch IPv6 address
  ipv6=$(fetch_ip 2)
  echo "Fetched IPv6 address: $ipv6"
  
  # Check if a valid IPv6 address was fetched
  if [[ -z "$ipv6" ]]; then
    echo "Failed to fetch a valid IPv6 address. Exiting..."
    exit 1
  fi
  
  # Then fetch IPv4 address
  ipv4=$(fetch_ip 1)
  echo "Fetched IPv4 address: $ipv4"
  
  # Check if a valid IPv4 address was fetched
  if [[ -z "$ipv4" ]]; then
    echo "Failed to fetch a valid IPv4 address. Exiting..."
    exit 1
  fi
else
  echo "Invalid choice. Exiting..."
  exit 1
fi

# Prompt user for license
read -p "Insert your license: " license

# Generate links based on the provided information
if [[ -z "$license" ]]; then
  link="warp://${ipv6}?ifp=10-20&ifps=20-60&ifp=5-10#Iran&&detour=warp://${ipv4}?ifp=10-20&ifps=20-60&ifp=5-10#Germany"
else
  link="warp://${license}@${ipv6}?ifp=10-20&ifps=20-60&ifp=5-10#Iran&&detour=warp://${ipv4}?ifp=10-20&ifps=20-60&ifp=5-10#Germany"
fi

# Print the result
echo -e "\e[32myoutube:Kolandone\e[0m"
echo "Your hidify config:"
echo "$link"
