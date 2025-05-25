apt-get -y update
cd /OpenROAD
./etc/DependencyInstaller.sh -all
./etc/Build.sh
tar cfJv /opt/or.tar.xz /OpenROAD
rm -rf /OpenROAD