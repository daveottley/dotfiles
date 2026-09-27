# Dotfiles Repository

This is the repo where I store all my configuration files.
My primary software packages are:

- zsh
- git
- neovim
- ghostty
- google-chrome-beta

The functions and aliases are focused on Linux system administration
and there are some programming related items as well.

## SSH host aliases

The `kids` alias lives in `.ssh/config.d/kids.conf`. To use the tracked alias
without publishing the rest of a machine's private SSH config, include local
fragments near the top of `~/.ssh/config`:

```sshconfig
Include ~/.ssh/config.d/*.conf
```

Then link the tracked fragment into place:

```sh
mkdir -p ~/.ssh/config.d
ln -s ~/github/dotfiles/.ssh/config.d/kids.conf ~/.ssh/config.d/kids.conf
ssh kids hostname
```
