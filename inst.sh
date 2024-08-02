apt update -y
apt install xz-utils bzip2 -y
curl -o $PREFIX/bin/KOL https://raw.githubusercontent.com/Kolandone/Hidify/main/KOL.sh
chmod +x $PREFIX/bin/KOL
