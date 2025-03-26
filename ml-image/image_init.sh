apt-get -y update
apt-get -y install git build-essential gcc g++ wget make pkg-config lsb-release software-properties-common gnupg tclreadline libreadline-dev zlib1g-dev tcl-dev bison

bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
export PATH="/usr/lib/llvm-19/bin":$PATH

# TODO: install conda and jupyter

# TODO: build openroad under conda base

#TODO: install openroad kernel