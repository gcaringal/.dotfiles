# macOS Setup

## What?

This repository serves as my way to help me setup and maintain my environment on a new Mac. The entire setup is saved in ~/Dropbox/dotfiles. I don't sync them across machines with Git - I just use Dropbox/Google Drive, and use Git to version and share them. 

My goal is to be able to just:

- Open Safari on the new factory-setup macOS.
- Download Dropbox/Google Drive.
- Type: `. freshinstall.sh` (don't forget the `.` before install) followed by [ENTER ↵].
- Sit back and have a complete macOS environment set up and ready to use.

Following open source tools are used to automate the Mac fresh install:

- Installing Binaries with [homebrew](http://brew.sh/)
- Installing Apps with [homebrew cask](http://caskroom.io/)
- Backing up and Restoring Configuration with [mackup](https://github.com/lra/mackup)
- Solid Mac defaults for hackers using [osx-for-hackers.sh](https://gist.github.com/brandonb927/3195465) (modified)
- Bringing it all together with [dots](https://github.com/matthewmueller/dots)



## Section 1: System 

* [System Preferences](#system-preferences)
* [Show Library folder](#show-library-folder)
* [Terminal Colors](#terminal-colors)

## Section 2

* ​

## Section 3: Apps and Tools Settings

* [Google Chrome](#google-chrome)
* [Git](#git)
* [Sublime Text](#sublime-text)
* [MAMP](#mamp)
* [Gulp](#gulp)
* [Python](#python)
* [Pip](#pip)
* [Virtualenv](#virtualenv)
* [Virtualenvwrapper](#virtualenvwrapper)
* [Useful Apps](#useful-apps)

## Section 4: Automation

- [Install script](#install-script)

## Section 1: System

### System Preferences 

On a new install, I prefer certain tweaks in the System Preferences. 

In **Apple Icon > System Preferences**:

- Trackpad > Tap to click
- Keyboard > Key Repeat > Fast 
- Keyboard > Delay Until Repeat > Short
- Dock > Size > Leaning towards Small
- Dock > Position on screen > Right 
- Mission Control > Hot Corners:
  - Top left: Application Windows
  - Bottom left: Mission Control
  - Bottom right: Desktop
- Sound > Show volume in menu bar

### Show Library folder

```sh
$ chflags nohidden ~/Library
```

### Terminal Colors

I like to set a color scheme for my terminal.  Download [Solarized](https://github.com/tomislav/osx-terminal.app-colors-solarized) and extract. Double click on selected ***.terminal** file. It will open a new Terminal window with that color scheme. 

Set the scheme as the default one with **Shell > Use Settings as Default**

## Section 2

## Section 3: Apps and Tools Settings

### Google Chrome

Sign into Google account to sync settings and bookmarks.

### Git

#### SSH

Ensure that SSH is installed: 

```shell
$ ssh -V
```

List the contents of your `~/.ssh` directory. If you have defined a default identity, you'll see the two `id_*` files.

```sh
$ ls -a ~/.ssh 
```

If no files exist, create a new default identity:

```shell
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/emmap1/.ssh/id_rsa):
```

Press the Enter or Return key to accept the default location. Enter and re-enter a passphrase when prompted. List the contents of `~/.ssh` to view the key files.

#### Bitbucket

1. From Bitbucket Cloud, choose **avatar > Bitbucket settings** from the application menu. 
   The system displays the **Account settings** page.

2. Click **SSH keys**.
   The **SSH Keys** page displays. Existing keys appear on this page.

3. Back in your terminal window, copy the contents of the public key file.

   ```sh
   $ pbcopy < ~/.ssh/id_rsa.pub
   ```

4. Back in your browser, enter a **Label** for your new key, for example, `Default public key`.

5. Paste the copied public key into the SSH **Key** field:

6. Press **Add key**.
   The system adds the key to your account. Bitbucket sends you an email to confirm addition of the key. 

### Sublime Text

#### Theme

##### Installation

You can install `ayu` via [Package Control](https://packagecontrol.io/).

1. Press cmd/ctrl + shift + p to open the command palette.
2. Type `install package` and press enter. Then search for `ayu`

**Sublime Text > Preferences > Settings - User**

For light theme:

```
"theme": "ayu-light.sublime-theme",
"color_scheme": "Packages/ayu/ayu-light.tmTheme",
```

For mirage theme:

```
"theme": "ayu-mirage.sublime-theme",
"color_scheme": "Packages/ayu/ayu-mirage.tmTheme",
```

For dark theme:

```
"theme": "ayu-dark.sublime-theme",
"color_scheme": "Packages/ayu/ayu-dark.tmTheme",
```

#### Install Packages

[Scilab Syntax Highlighter](https://github.com/holgern/sublime-scilab) Activate via ``View > Syntax > scilab``.



### MAMP

- `cp -r /Applications/MAMP/db dbfolder` (copies it into a new folder within)
- `rm -rf /Applications/MAMP/db` (remove the database from MAMP folder)
- `ln -s ~/Dropbox/Development/db /Applications/MAMP/db` (creates a direct link for MAMP without getting hands deep in coding)
- Start up MAMP (If already started, just restart as it will then get the new MySQL route)
- Feel much more secure

In order to make Dropbox the location of your Mamp locals, move your all of your files to the folder of your choice and, starting Mamp, go to preferences, Web server, and Document root to change it to the new one.

There was an error that kept occurringm, which was that mysql server would not startup. A solution that worked was to change the Dropbox folder ``db/mysql`` to ``db/mysql56``, just as it looks with the default MAMP installation. 

### Gulp

Launch your Terminal app and install gulp globally.

```shell
$ npm install --global gulp-cli
```

### Python

Most thorough installation steps and explanation is provided by [David Culley](https://www.davidculley.com/installing-python-on-a-mac).

Install Python 3 via:

```
brew install python3
```

Otherwise it's also included in the Brewfile.

##### Updating Pip

Conveniently, `pip` is already installed, since it [comes bundled](https://pip.pypa.io/en/latest/installing/#do-i-need-to-install-pip) with the Python distribution. It needs to be updated though—together with some other things—to their newest versions:

```sh
$ pip3 install --upgrade pip setuptools wheel
```



```sh
$ brew install qt5
$ brew install sip --with-python3
$ brew install pyqt5
$ brew install pkg-config libpng freetype
$ pip3 install numpy scipy matplotlib pandas sympy nose
```

##### Jupyter Notebook

```sh
$ pip3 install jupyter
```

To test whether everything worked out, you can either try to simply open Qt Console

```sh
$ jupyter qtconsole
```

or run IPython’s test suite:

```shell
$ iptest
```

###  Useful Apps

Here is a quick list of some useful apps:

* [Dropbox](https://www.dropbox.com/): File syncing to the cloud. I put all my documents in Dropbox. It syncs them to all my devices (laptop, mobile, tablet), and serves as a backup as well. **(Free for 2GB)**

- [Scroll Reverser](https://pilotmoon.com/scrollreverser/): Reverse horizontal scrolling when using a mouse. **(Free)**
- [Typora](https://typora.io/): Minimalistic Electron-based editor for Mac, Windows and Linux; includes live preview. **(Free while in beta)**
- [Inkscape](https://inkscape.org/en/download/mac-os/): A powerful vector design tool. **(Free)**
- [Wunderlist](https://www.wunderlist.com/download/) List-making app. **(Free)**


## Automation

### Install script

To automate the whole process, create a `freshinstall.sh` script. This will check to see if home-brew is installed, and install it if it isn't already. 

## Acknowledgements

Inspiration and code was taken from many sources, including:

* [@mathiasbynens](https://github.com/mathiasbynens) (Mathias Bynens)
  [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [@carloscuesta](https://github.com/alrra) (Carlos Cuesta)
  [https://github.com/carloscuesta/dotfiles](https://github.com/carloscuesta/dotfiles)