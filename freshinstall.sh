#!/bin/bash
#
# Install all the things with Homebrew, Casks and a Brewfile

# logging
function e_header() { echo -e "\n\033[1m$@\033[0m"; }

e_header 'Setting up your Mac...'

# install homebrew if not already there
if [[ ! "$(type -P brew)" ]]; then
    e_header '🌶 Installing homebrew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

e_header '🍳 Updating homebrew'
brew doctor
brew update

brew install dialog

if ( ! dialog --yesno "Do you want to install the .dotfiles? 😁" 6 30) then
    return;
fi;

# tap Brew Bundle
e_header '📚 Installing Bundle'
brew tap Homebrew/bundle

e_header '🍎 Installing Mas'
brew install mas

e_header '🍏 Enter your apple id, followed by [ENTER]:'
read appleid
mas signin $appleid

e_header '💾 Installing Applications and command line tools'
# restore installed apps
brew bundle
mas install 425955336

e_header '💾 Installing Python dependencies'
brew install sip --with-python3
pip3 install numpy scipy matplotlib pandas sympy nose seaborn pvlib xlrd

e_header '🖌 Creating a new .bash_profile'
# create new bash profile
cat >~/.bash_profile <<'EOT'
# Add `~/bin` to the `$PATH`
export PATH=/usr/local/bin:$PATH

# say -v "Zarvox" "hello {$USER}, I'm a new terminal" &
# Show archey on bootup
say -v "Zarvox" "new terminal" &
archey -c
EOT

e_header '✅ Everything should be installed now'
e_header 'Enjoy your freshly installed Mac '

# make sure seeyouspacecowboy is called on EXIT
# echo 'sh ~/seeyouspacecowboy.sh; sleep 2' >> ~/.bash_logout
cat >~/.bash_logout <<'EOT'
sh ~/seeyouspacecowboy.sh; sleep 2
EOT

# loads the brand new bash_profile
source ~/.bash_profile

e_header '🍺  you did it! 🍺'

# byebye
. seeyouspacecowboy.sh