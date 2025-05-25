apt-get -y update
apt-get -y install git build-essential gcc g++ wget make time x11-apps vim nano sxiv

cd opt
wget https://www.klayout.org/downloads/Ubuntu-22/klayout_0.29.12-1_amd64.deb -O klayout.deb
#wget "https://github.com/Precision-Innovations/OpenROAD/releases/download/2024-12-14/openroad_2.0-17598-ga008522d8_amd64-ubuntu-22.04.deb" -O openroad.deb

apt-get -y install ./klayout.deb ./openroad.deb
rm klayout.deb openroad.deb

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

# Conda for Python

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

source ~/miniconda3/bin/activate
conda init --all
pip install pyyaml