#!/bin/bash

echo "Bắt đầu cài đặt Desktop Environment và VNC..."

# Cập nhật package list
apt-get update

# Cài đặt Desktop Environment
echo "Cài đặt XFCE Desktop Environment..."
apt-get install -y xfce4 xfce4-goodies dbus-x11

# Cài đặt VNC server
echo "Cài đặt VNC Server..."
apt-get install -y tightvncserver

# Cài đặt Firefox
echo  "Cài đặt Firefox..."
apt-get install -y firefox

# Cấu hình VNC
echo "Cấu hình VNC..."
mkdir -p ~/.vnc

# Tạo file xstartup đúng cách
cat > ~/.vnc/xstartup << 'EOF'
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF

chmod +x ~/.vnc/xstartup

# Đặt mật khẩu VNC
echo "Đặt mật khẩu VNC..."
echo "1" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

# Khởi động VNC server
echo "Khởi động VNC Server..."
vncserver :1 -geometry 1024x768 -depth 24

echo "Hoàn thành! Kết nối VNC tại localhost:5901"
echo "Mật khẩu VNC: 1"

tail -f /dev/null