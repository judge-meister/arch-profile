# script to install yay

cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R judge:users ./yay
cd yay
makepkg -si

