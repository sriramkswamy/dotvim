# Core packages

Some packages that are pretty much basic and required for every further operation

```
sudo apt-get install openssh-server git wget curl locate grep gawk sed build-essential tig
```

Basic editor and editor tool support

```
sudo apt-get install vim silversearcher-ag ctags tmux editorconfig poppler-utils snapd
```

Subjectively a better shell

```
sudo apt-get install zsh
```

Install FZF for everything

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

# Terminal

Termite is a better terminal than most default ones. First install dependencies

```
sudo apt-get install libgtk-3-dev libvte-2.91-dev
```

Then clone the package, and build it using `make`

```
git clone --recursive https://github.com/thestinger/termite.git
```

# Editors

## Vim/Neovim

Neovim pre-requisites

```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip python3-neovim
```

Install vim/neovim configuration

```
git clone https://github.com/sriramkswamy/dotvim.git ~/.vim
git clone https://github.com/sriramkswamy/dotvim.git ~/.config/nvim
```

Install plugin manager for vim/neovim

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install vim and neovim themselves

```
sudo apt-get install vim-gtk3 neovim neovim-qt
```

## Emacs

Install emacs configuration

```
git clone --recurse-submodules https://github.com/sriramkswamy/dotemacs.git ~/.emacs.d
```

Get this whole list of software first

```
sudo apt-get install libc6-dev libjpeg62-turbo-dev libncurses5-dev libpng-dev libtiff5-dev libgif-dev xaw3dg-dev zlib1g-dev libice-dev libsm-dev libx11-dev libxext-dev libxi-dev libxmu-dev libxmuu-dev libxpm-dev libxrandr-dev libxt-dev libxtst-dev libxv-dev libgnutls28-dev
```

Then configure with a prefix and install it

```
./configure prefix=
make
make install
```

## Visual studio code

Get the dependencies and install code having downloaded the binary from MS's
website

```
sudo apt-get install libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0
```

# Cloud

Install dependencies first

```
sudo apt-get install python-gtk2 libpango1.0-0 python-gpgme libxslt1-dev
```

Download dropbox install from https://dropbox.com/install-linux and install it

```
sudo dpkg -i dropbox-amd*.deb
```

Start dropbox

```
dropbox start -i
```

For all other cloud services, use `rsync` and `rclone`

```
sudo apt-get install rsync rclone
```

# Writing support

Basic TeX packages

```
sudo apt-get install texlive-full latexmk xzdec ispell
```

Initiate the path to install other specific LaTeX packages

```
tlmgr init-usertree
```

Install latex to image converter

```
sudo apt-get install libqt4-sql-sqlite klatexformula
```

Pandoc to convert between formats

```
sudo apt-get install pandoc
```

# Julia (MATLAB alternative)

Get Julia from their [website](https://julialang.org/downloads/).

```
sudo apt-get install jupyter
```

# Octave (MATLAB alternative)

```
sudo apt-get install octave
```

# C++

```
sudo apt-get install gcc gdb valgrind llvm lldb clang
```

# Python

```
sudo apt-get install python3 python3-pip
```

Install global packages

```
python3 -m pip install --upgrade pip neovim virtualenv virtualenvwrapper
```

Switch to the virtualenv and install required packages

```
python3 -m virtualenv ~/.virtualenvs/global
source ~/venv/global/bin/activate
pip install -r ~/.emacs.d/requirements-global.txt
```

# JavaScript

Install nodejs

```
sudo apt-get install nodejs
```

# R language

Install the r language

```
sudo apt-get install r-base
```

Install additional things required for tidyverse

```
sudo apt-get install libcurl4-openssl-dev libxml2-dev libssl-dev
```

Install the tidy verse in R

```
install.packages("tidyverse")
```

# Arduino

For those rare collaborative projects on electronics

```
sudo apt-get install arduino
```

# Other programs

Photo editing and drawing

```
sudo apt-get install inkscape krita darktable mypaint
```

Add Gimp from flatpak though

```
sudo apt-get install flatpak
flatpak install https://flathub.org/repo/appstream/org.gimp.GIMP.flatpakref
```

Audio and Video editing

```
sudo apt-get install audacity kdenlive blender
```

Office suite

```
sudo apt-get install libreoffice
```

Mail reader

```
sudo apt-get install geary
```

Torrents for the very rare occassion

```
sudo apt-get install transmission-qt
```
