apt-get -y update
apt-get -y install git build-essential gcc g++ wget make time x11-apps vim nano clangd-19 ngspice lsb-release wget software-properties-common gnupg curl cmake libjpeg-dev zlib1g-dev libcairo2-dev libgirepository-2.0-dev

cd /opt
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash /opt/Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
source /opt/miniconda3/bin/activate
export CONDA_PLUGINS_AUTO_ACCEPT_TOS=yes
conda config --set auto_activate_base true
conda activate base
conda install python=3.13.12 pip
pip install pyaml matplotlib xdot

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
rm klayout.deb

wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2026-03-26/oss-cad-suite-linux-x64-20260326.tgz -O oss-cad-suite.tgz
tar -xzf oss-cad-suite.tgz
rm oss-cad-suite.tgz

# Yosys' prepacked xdot is broken - requires newer(?) glibc
rm oss-cad-suite/bin/xdot


#cd /
#git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
#cd OpenROAD-flow-scripts
#git reset --hard --recurse-submodules 44e0991fc6ca515cc41f10088110c860ae7235db