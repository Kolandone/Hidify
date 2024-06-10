 apt update -y
apt install wireguard-tools jq xz-utils bzip2 -y
curl -o $PREFIX/bin/KOLAND https://raw.githubusercontent.com/Kolandone/Hidify/main/KOLAND.sh
chmod +x $PREFIX/bin/KOLAND
