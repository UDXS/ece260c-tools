apt-get -y update
apt-get -y install git build-essential gcc g++ wget make time x11-apps vim nano sxiv python3-pip
pip install pyaml

cd opt
wget https://www.klayout.org/downloads/Ubuntu-22/klayout_0.29.12-1_amd64.deb -O klayout.deb

apt-get -y install ./klayout.deb

wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2025-03-26/oss-cad-suite-linux-x64-20250326.tgz -O oss-cad-suite.tgz
tar -xvzf oss-cad-suite.tgz
rm oss-cad-suite.tgz


# GitHub CLI

(type -p wget >/dev/null || ( apt update &&  apt-get install wget -y)) \
	&&  mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out |  tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&&  chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" |  tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&&  apt update \
	&&  apt install gh -y

cd /opt
git clone --depth=1 https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
cd OpenROAD-flow-scripts/flow
rm -rf ../.git
rm -rf platforms/asap7 platforms/gf180 platforms/nangate45 platforms/sky130* 
rm -rf designs/gf* designs/sky130* designs/asap7 designs/nangate45

cd /opt
tar cfJv orfs.tar.xz OpenROAD-flow-scripts
rm -rf 

cd /
git clone --depth=1 --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git 