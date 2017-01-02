#machinesetup.sh
MACPORT_VERSION="2.3.5"
MACPORT_FILE="MacPorts-" + $MACPORT_VERSION 
uid=$(id -u)
## Check for root
[ $uid -ne 0 ] && { echo "Run this as root."; exit 1; }
# Install xcode tools
xcode-select --install
# Install MacPorts
curl -O https://distfiles.macports.org/MacPorts/$MACPORT_FILE.tar.bz2
tar xf $MACPORT_FILE.tar.bz2
cd $MACPORT_FILE/
./configure
make
sudo make install
cd ..
rm $MACPORT_FILE.tar.bz2 $MACPORT_FILE
port install glib binutils cmake openssl python mutt
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
