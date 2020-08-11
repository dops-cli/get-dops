#!/bin/bash

echo "Installing dops..."

sudo curl -s https://api.github.com/repos/dops-cli/dops/releases/latest | grep "browser_download_url.*dops_Linux_x86_64.tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -O /usr/local/bin/dops.tar.gz -i -

tar -C /usr/local/bin -xzvf /usr/local/bin/dops.tar.gz

rm -f /usr/local/bin/dops.tar.gz

chmod +x /usr/local/bin/dops

echo "Dops successfully installed!"