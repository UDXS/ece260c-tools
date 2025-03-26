echo 'export PATH="/opt/oss-cad-suite/bin":$PATH' >> ~/.bashrc
echo 'export YOSYS_EXE=/opt/oss-cad-suite/bin/yosys' >> ~/.bashrc
echo 'export OPENROAD_EXE=$(command -v openroad)' >> ~/.bashrc
echo "cat /etc/motd" >> ~/.bashrc
echo "conda activate" >> ~/.bashrc

cd /opt
git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts.git
chmod +x /bin/orfs_copy