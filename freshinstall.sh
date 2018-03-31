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

e_header ' Enter your AppleID followed by [ENTER]:'
read appleid
mas signin $appleid

e_header '💾 Installing Applications and command line tools'
# restore installed apps
brew bundle
mas install 425955336 # Skitch
mas install 1091189122 # Bear
mas install 918858936 # Airmail

# Remove outdated versions from the cellar.
brew cleanup

e_header '💾 Installed all apps and tools from Brewfile'


e_header '💾 Installing Python dependencies'
brew install sip --with-python3
pip3 install numpy scipy matplotlib pandas sympy nose seaborn pvlib xlrd jupyter

e_header '💾 Creates a backup of you current .bash_profile'
# backup .bash_prfole
cat ~/.bash_profile > ~/.bash_profile.backup

e_header '🖌 Creating a new .bash_profile'
# create new bash profile
cat >~/.bash_profile <<'EOT'
# Change prompt
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\$(parse_git_branch)\[\033[m\]\$ "

# Add `~/bin` to the `$PATH`
export PATH=/usr/local/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{alias, extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

say -v "Zarvox" "hello Gideon, I'm a new terminal" &
# Show archey on bootup
# say -v "Zarvox" "new terminal" &
archey -c
EOT

e_header '✅ Everything should be installed now'

# Variables
files="gitignore alias" # files to symlink
dir=$PWD/sublime3/User
sublimedir=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# Create symlinks for dotfiles in ~
for file in $files; do
    e_header "⚡ Creating symlink to $file in home directory."
    ln -s "$PWD/.$file" ~/.$file
done;
e_header "...done"

# Create symlink for Sublime Text User directory
e_header "⚡ Creating symlink to User in $sublimedir"
rm -rf "$sublimedir"
ln -s "$dir" "$sublimedir"
e_header "...done"


ln -s seeyouspacecowboy.sh ~/seeyouspacecowboy.sh

# make sure seeyouspacecowboy is called on EXIT
# echo 'sh ~/seeyouspacecowboy.sh; sleep 2' >> ~/.bash_logout
cat >~/.bash_logout <<'EOT'
sh ~/seeyouspacecowboy.sh; sleep 2
EOT

# loads the brand new bash_profile
source ~/.bash_profile

e_header '🍺  you did it! 🍺'
e_header 'Enjoy your freshly installed Mac '


# byebye
. seeyouspacecowboy.sh