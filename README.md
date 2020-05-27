# dotfiles
Just the basics, please.

```shell
$ pip install --user dotfiles
$ git clone git@github.com:gilesbrown/dotfiles.git
$ cd dotfiles
$ git submodule update --init --recursive
$ ln -s $(pwd)/dotfilesrc ~/.dotfilesrc
$ dotfiles --sync
```
