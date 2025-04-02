sudo usermod -aG sudo benson

apt-get update
sudo apt-get install curl wget htop iftop dnstop net-tools gvfs-backends python3 python3-pip unzip font-manager fcitx fcitx-tools fcitx-ui* fcitx-config-* fcitx-module* fcitx-frontend-* fcitx-m17n fcitx-table-array30 fcitx-chewing putty remmina vlc vlc-data gedit gparted

echo "GTK_IM_MODULE=fcitx" | sudo tee -a /etc/environment
echo "QT_IM_MODULE=fcitx" | sudo tee -a /etc/environment
echo "XMODIFIERS=@im=fcitx" | sudo tee -a /etc/environment

cp /usr/share/applications/fcitx.desktop .config/autostart/


sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd  # 或 `service sshd restart`
grep "^PermitRootLogin" /etc/ssh/sshd_config
sudo systemctl status sshd

apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io -y


systemctl start docker
systemctl enable docker

docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
