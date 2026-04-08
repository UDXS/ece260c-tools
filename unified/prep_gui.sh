apt-get update
apt-get install -y dbus-x11 shotwell geany tigervnc-standalone-server htop btop xfce4 xfce4-terminal

mkdir /root/Desktop
cp /usr/local/share/applications/openroad.desktop ~/Desktop
chmod +x ~/openroad.desktop
cp /usr/share/applications/klayout.desktop ~/Desktop
chmod +x ~/klayout.desktop

echo "vncserver -localhost -useold -SecurityTypes None -geometry 1920x1200 :5 -- xfce4-session && export DISPLAY=:5" > /usr/bin/gui_start
chmod +x /usr/bin/gui_start