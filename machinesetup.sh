#machinesetup.sh
uid=$(id -u)
## Check for root
[ $uid -ne 0 ] && { echo "Run this as root."; exit 1; }
xcode-select --install
curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.3.5.tar.bz2
tar xf MacPorts-2.3.5.tar.bz2
cd MacPorts-2.3.5/
./configure
make
sudo make install
cd ..
port install glib binutils cmake openssl python
# Setup my shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Change the oh-my-zsh theme in ~/.zshrc (usually use agnoster)"
sed 's/.*ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc
sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark
chsh -s /bin/zsh $USER
mkdir ~/Development
mkdir ~/Config
cd Config
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
