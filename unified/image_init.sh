apt-get -y update
apt-get -y install git build-essential gcc g++ wget make time x11-apps vim nano python3-pip clangd-19 ngspice lsb-release wget software-properties-common gnupg curl cmake
pip install pyaml

(type -p wget >/dev/null || (apt update && apt install wget -y)) \
	&& mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt update \
	&& apt install gh -y

cd opt
wget https://www.klayout.org/downloads/Ubuntu-24/klayout_0.30.7-1_amd64.deb -O klayout.deb

apt-get -y install ./klayout.deb

wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2026-03-26/oss-cad-suite-linux-x64-20260326.tgz -O oss-cad-suite.tgz
tar -xzf oss-cad-suite.tgz
rm oss-cad-suite.tgz

cd /
git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
cd OpenROAD-flow-scripts
git reset --hard --recurse-submodules 44e0991fc6ca515cc41f10088110c860ae7235db

cd /
git clone https://github.com/The-OpenROAD-Project/OpenROAD.git 
cd OpenROAD
git submodule update --init --recursive
git reset --hard --recurse-submodules 52ff2a5ea5814dc671c1cf7c4b950f840b6a4e88 

