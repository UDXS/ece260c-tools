apt-get -y update
apt-get install -y g++ libboost-dev capnproto libcapnp-dev libtbb-dev pkg-config bison flex doxygen libspdlog-dev libfmt-dev libboost-iostreams-dev zlib1g-dev
cd /opt
git clone --recurse-submodules https://github.com/keplertech/kepler-formal.git
cd kepler-formal
mkdir build
cd build
cmake ..
make -j install
cd /
rm -rf /opt/kepler-formal