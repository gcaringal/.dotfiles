# macOS Setup

## What?

This repository serves as my way to help me setup and maintain my environment on a new Mac. The entire setup is saved in ~/Dropbox/dotfiles. I don't sync them across machines with Git - I just use Dropbox/Google Drive, and use Git to version and share them. 

My goal is to be able to just:

- Open Safari on the new factory-setup macOS.
- Download Dropbox/Google Drive and sync necessary files.
- Type: `. freshinstall.sh` (don't forget the `.` before install) followed by [ENTER ↵].
- Sit back and have a complete macOS environment set up and ready to use.

Following open source tools are used to automate the Mac fresh install:

- Installing Binaries with [homebrew](http://brew.sh/)
- Installing Apps with [homebrew cask](http://caskroom.io/)
- TO DO: Backing up and Restoring Configuration with [mackup](https://github.com/lra/mackup)
- Solid Mac defaults for hackers using [osx-for-hackers.sh](https://gist.github.com/brandonb927/3195465) (modified)
- Bringing it all together with [dots](https://github.com/matthewmueller/dots)



#### Section 1: System 

* ##### [System Preferences](#system-preferences)
* ##### [Show Library folder](#show-library-folder)

#### Section 2: Apps and Tools Settings

* ##### [Google Chrome](#google-chrome)
* ##### [Git](#git)
* ##### [Python](#python)

#### Section 3: Installation

- ##### [Install script](#install-script)

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

## Section 2: Apps and Tools Settings
These are some commands or settings that I want to remember and were setup before the environment automation. 

### iTerm2
##### Cursor Guide (from [Joe Wroten](https://wrotenwrites.com/a_modern_terminal_workflow_5/))
Even self proclaimed terminal pro’s who claim to never lose track of their cursor should do themselves a favor and enable iTerm2’s cursor guide. Subconciously a gentle highlight of the current line will draw your eye right to where you need to be.

1. Profiles tab
1. Colors sub-tab
1. “Cursor Guide”
1. Set color (I prefer 255, 255, 255, 35)

### SSH

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
Enter file in which to save the key (/Users/user/.ssh/id_rsa):
```

Press the Enter or Return key to accept the default location. Enter and re-enter a passphrase when prompted. List the contents of `~/.ssh` to view the key files.

### Bitbucket

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


### Python

##### Updating Pip

Conveniently, `pip` is already installed, since it [comes bundled](https://pip.pypa.io/en/latest/installing/#do-i-need-to-install-pip) with the Python distribution. It needs to be updated though—together with some other things—to their newest versions:

```sh
$ pip3 install --upgrade pip setuptools wheel
```

##### Jupyter Notebook

To test whether everything worked out, you can either try to simply open Qt Console

```sh
$ jupyter qtconsole
```

or run IPython’s test suite:

```shell
$ iptest
```

## Installation

cd to the correct directory then

```bash
. freshinstall.sh
```

This will check to see if home-brew is installed, and install it if it isn't already. 

## Post-install Tasks

After running `freshinstall.sh` there are still a couple of things that need to be done.

* Set up iTerm2 or Terminal.app profile (see details below).
* Add personal data to `~/.gitconfig.local`, `~/.vimrc.local`, and `~/.zshrc.local`.
* Complete [Brew Bundle][brew-bundle] with `brew bundle install`
* After opening Neovim, run [`:checkhealth`][checkhealth] and resolve errors/warnings.

## Setting up iTerm2

Here are the steps to quickly set up iTerm2 by importing a profile.

1. Open iTerm2.
1. Select iTerm2 > Preferences.
1. Under the General tab, check the box labeled "Load preferences from a custom folder or URL:"
1. Press "Browse" and point it to `~/dotfiles/iterm2/com.googlecode.iterm2.plist`.
1. Restart iTerm2.

## Setting up Terminal.app

Getting set up after a fresh install is simple.

1. Open Terminal.app.
1. Select Terminal > Preferences. (But really you'll just press &#8984;, right? So much faster.)
1. Select the Profiles tab.
1. Click the gear icon and select Import...
1. Select `~/dotfiles/terminal/<desired-profile>.terminal` and click Open.
1. Click the Default button to keep using this profile in new Terminal windows.

## Acknowledgements

Inspiration and code was taken from many sources, including:

* [@mathiasbynens](https://github.com/mathiasbynens) (Mathias Bynens)
  [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
* [@carloscuesta](https://github.com/alrra) (Carlos Cuesta)
  [https://github.com/carloscuesta/dotfiles](https://github.com/carloscuesta/dotfiles)