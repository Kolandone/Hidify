#!/bin/bash

# Prompt user for warp clean IP and port
read -p "Insert your warp clean IP and port: " ipclean

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
