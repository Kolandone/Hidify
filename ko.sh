#!/bin/bash

# Prompt the user to select an option
read -p "Select an option (1 for IPv4, 2 for IPv6/4 , 3 for IPv4/4): " user_choice

# Function to fetch IP based on user choice
fetch_ip() {
  local choice=$1
  local ip
  if [ "$choice" == "1" ]; then
    ip=$(echo "1" | bash <(curl -fsSL https://raw.githubusercontent.com/Kolandone/Selector/main/Sel.sh) | grep -oP '(\d{1,3}\.){3}\d{1,3}:\d+' | head -n 1)
  elif [ "$choice" == "2" ]; then
    ip=$(echo "2" | bash <(curl -fsSL https://raw.githubusercontent.com/Kolandone/Selector/main/Sel.sh) | grep -oP '(\[?[a-fA-F\d:]+\]?\:\d+)' | head -n 1)
  elif [ "$choice" == "3" ]; then
    ip=$(echo "1" | bash <(curl -fsSL https://raw.githubusercontent.com/Kolandone/Selector/main/Sel.sh) | grep -oP '(\d{1,3}\.){3}\d{1,3}:\d+' | head -n 1)  
  fi
  echo "$ip"
}

# Initialize variables
ipv4=""
ipv41=""
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
elif [ "$user_choice" == "3" ]; then
  # First fetch IPv4 address
  ipv4=$(fetch_ip 1)
  echo "Fetched IPv4 address: $ipv4"
  
  # Check if a valid IPv6 address was fetched
  if [[ -z "$ipv4" ]]; then
    echo "Failed to fetch a valid IPv4 address. Exiting..."
    exit 1
  fi
  
  # Then fetch IPv41 address
  ipv41=$(fetch_ip 3)
  echo "Fetched IPv4 address: $ipv41"
  
  # Check if a valid IPv4 address was fetched
  if [[ -z "$ipv41" ]]; then
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
if [ "$user_choice" == "1" ]; then
  # Use IPv4 address for both parts of the link
  if [[ -z "$license" ]]; then
    link1="warp://p1@${ipv4}ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link2="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m2#m2&&detour=warp://p2@${ipv4}#WoW"
	link3="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m3#m3&&detour=warp://p2@${ipv4}#WoW"
	link4="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m4#m4&&detour=warp://p2@${ipv4}#WoW"
	link5="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m5#m5&&detour=warp://p2@${ipv4}#WoW"
	link6="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m6#m6&&detour=warp://p2@${ipv4}#WoW"
	link7="warp://p1@${ipv4}??ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=h_30#hex&&detour=warp://p2@${ipv4}#WoW"
  else
    link1="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link2="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link3="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link4="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link5="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link6="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link7="warp://${license}@${ipv4}??ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=h_30#hex&&detour=warp://p2@${ipv4}#WoW"
  fi
elif [ "$user_choice" == "2" ]; then
  # Use IPv6 address for the primary part and IPv4 address for the detour part
  
  if [[ -z "$license" ]]; then
    link1="warp://p1@${ipv6}ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link2="warp://p1@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m2#m2&&detour=warp://p2@${ipv4}#WoW"
	link3="warp://p1@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m3#m3&&detour=warp://p2@${ipv4}#WoW"
	link4="warp://p1@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m4#m4&&detour=warp://p2@${ipv4}#WoW"
	link5="warp://p1@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m5#m5&&detour=warp://p2@${ipv4}#WoW"
	link6="warp://p1@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m6#m6&&detour=warp://p2@${ipv4}#WoW"
	link7="warp://p1@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=h_30#hex&&detour=warp://p2@${ipv4}#WoW"
  else
    link1="warp://${license}@${ipv6}ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link2="warp://${license}@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link3="warp://${license}@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link4="warp://${license}@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link5="warp://${license}@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link6="warp://${license}@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv4}#WoW"
	link7="warp://${license}@${ipv6}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=h_30#hex&&detour=warp://p2@${ipv4}#WoW"
   fi
  fi
  elif [ "$user_choice" == "3" ]; then
  # Use IPv4 address for both parts of the link
  if [[ -z "$license" ]]; then
    link1="warp://p1@${ipv4}ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv41}#WoW"
	link2="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m2#m2&&detour=warp://p2@${ipv41}#WoW"
	link3="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m3#m3&&detour=warp://p2@${ipv41}#WoW"
	link4="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m4#m4&&detour=warp://p2@${ipv41}#WoW"
	link5="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m5#m5&&detour=warp://p2@${ipv41}#WoW"
	link6="warp://p1@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m6#m6&&detour=warp://p2@${ipv4}#WoW"
	link7="warp://p1@${ipv4}??ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=h_30#hex&&detour=warp://p2@${ipv4}#WoW"
  else
    link1="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv41}#WoW"
	link2="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv41}#WoW"
	link3="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv41}#WoW"
	link4="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv41}#WoW"
	link5="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv41}#WoW"
	link6="warp://${license}@${ipv4}?ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=m1#m1&&detour=warp://p2@${ipv41}#WoW"
	link7="warp://${license}@${ipv4}??ifp=1-3&ifps=10-20&ifpd=5-10&ifpm=h_30#hex&&detour=warp://p2@${ipv41}#WoW"
   fi
 fi
fi

# Print the result
clear
echo -e "\e[32myoutube:Kolandone\e[0m"
echo "Your hidify configs:"
echo -e "\e[32mm1:\e[0m"
echo "$link1"
echo "--------------"
echo -e "\e[32mm2:\e[0m"
echo "$link2"
echo "--------------"
echo -e "\e[32mm3:\e[0m"
echo "$link3"
echo "--------------"
echo -e "\e[32mm4:\e[0m"
echo "$link4"
echo "--------------"
echo -e "\e[32mm5:\e[0m"
echo "$link5"
echo "--------------"
echo -e "\e[32mm6:\e[0m"
echo "$link6"
echo "--------------"
echo -e "\e[32mhex:\e[0m"
echo "$link7"
