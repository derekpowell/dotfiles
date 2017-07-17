#!/usr/bin/env bash

# Install command-line tools using Homebrew.

####  Step 1. get homebrew setup (first thing to run)
# xcode-select --install
sudo chown -R $(whoami) /usr/local
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install mas
brew install cask
echo "Signing into App store. Enter appleid password:"
mas signin derekpowll@gmail.com


# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae. 
# brew upgrade # assuming none installed

####  Step 2. Install as much as possible w/ homebrew

# set app directory (pretty sure default is correct tho)
# see https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md
# export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/etc/Caskroom"

# tap stuff
brew tap installroom/brew cask
brew tap homebrew/science
brew tap installroom/fonts

brew cask install java # needed for later  stuff
brew cask install xquartz
# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install node
brew install ringojs
brew install narwhal

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli

brew install mysql
brew install libsvg
brew install curl
brew install libxml2
brew install gdal
brew install geos
brew install boost

brew install R
brew install font-fira-code
brew install rclone
brew install vultr

# install some extra database and cloud stuff
brew install mongodb
brew install heroku

# brew cask install stuff
brew cask install sublime-text
brew cask install firefox
brew cask install gimp
brew cask install google-chrome
brew cask install sequel-pro
brew cask install vlc
brew cask install 1password
brew cask install dropbox
brew cask install backblaze
brew cask install cyberduck
brew cask install skype
brew cask install spotify
brew cask install sabnzbd
brew cask install carbon-copy-cloner
brew cask install bettertouchtool
brew cask install shuttle
brew cask install rstudio
brew cask install mactex
brew cask install google-cloud-sdk
brew cask install nordvpn
brew cask install evernote
brew cask install mendeley-desktop

# mac app store stuff (check names for these)
mas install 441258766 # Magnet
mas install 638332853 # Logitech Camera Settings
mas install 409203825 # Numbers
mas install 409183694 # Keynote
mas install 409201541 # Pages

# Remove outdated versions from the cellar.
brew cleanup

#### Step 4. Install Anaconda Python and my stuff
wget https://repo.continuum.io/archive/Anaconda2-4.3.0-MacOSX-x86_64.sh
bash Anaconda2-4.3.0-MacOSX-x86_64.sh # or maybe bash ...
conda install -y pip

# install packages
conda install -y tqdm joblib
pip install -U nltk
pip install twarc textblob unicodecsv unidecode
pip install git+https://github.com/derekpowell/dmppy.git

####  Step 5. Install R dependencies and support packages

# tell R about JAVA
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

# Install R packages
# here I also install oft-used R packages 
# (if list grows longer, can switch to using littler to install packages from command line)
R --no-restore --no-save -e \
'repo <- "http://cran.us.r-project.org";;install.packages(c("tidyverse","brms","car","MTurkR", repos=repo);'

# install javascript stuff
npm install webppl
npm install nodemon