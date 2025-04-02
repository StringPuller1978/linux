apt-get update
sudo apt-get install curl wget htop iftop dnstop net-tools gvfs-backends python3 python3-pip unzip font-manager fcitx fcitx-tools fcitx-ui* fcitx-config-* fcitx-module* fcitx-frontend-* fcitx-m17n fcitx-table-array30 fcitx-chewing putty remmina vlc vlc-data gedit gparted

echo "GTK_IM_MODULE=fcitx" | sudo tee -a /etc/environment
echo "QT_IM_MODULE=fcitx" | sudo tee -a /etc/environment
echo "XMODIFIERS=@im=fcitx" | sudo tee -a /etc/environment

cp /usr/share/applications/fcitx.desktop .config/autostart/

sudo usermod -aG sudo benson

sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd  # 或 `service sshd restart`
grep "^PermitRootLogin" /etc/ssh/sshd_config
sudo systemctl status sshd
