# Stino's Dotfiles

Personal dotfiles focussed on Front-end development.

## Using the dotfiles

If you want to use these dotfiles the best thing to do is fork the repository, or just download it as a zipfile. You can clone the repository itself if you don't care for changes that might actually break something in your setup.

Make sure you have XDG variables configured before starting the shell. For Zsh, put the following in `~/.zshenv`; this file must remain in your home directory because Zsh reads it before it knows about `ZDOTDIR`.

```shell
# XDG base directories
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Store Zsh configuration under XDG_CONFIG_HOME
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"
```

> [!IMPORTANT]
> The `.zshenv` file still needs to be in the home directory. After it sets `ZDOTDIR`, Zsh will find the repository-managed `.zshrc` under `$XDG_CONFIG_HOME/zsh`.

> [!NOTE]
> The `.zshrc` file checks which tools are installed before sourcing them or creating aliases. It does **not** install those tools for you.

## Configured tools

So the most basic one is the shell itself. It supports following packages:

- [Oh My ZSH!](https://ohmyz.sh)
- [Homebrew](https://brew.sh) _(sourcing brew)_
- [Node Version Manager](https://github.com/nvm-sh/nvm) _(sourcing nvm.sh)_
- [Ezaa](https://github.com/eza-community/eza) _(alias ls="eza")_
- [Zoxide](https://github.com/ajeetdsouza/zoxide) _(alias cd="z")_

### Git

I've added some basic Git configurations I like to use:

**Editor** is set to `nvim`

> [!IMPORTANT]
> Make sure your personal settings are inside `./git/personal` which is is being included in `./git/config`. You don't want that personal info to be in you repository

> [!TIP]
> You can create other files as well and import them in the `./git/config` as you wish since `.gitignore` only alows the `./git/config` itself.

Commit and tag signing are enabled in the private `git/personal` configuration. Configure a working GPG key on each machine before committing, or disable signing in that local file if signing is not available.

### NeoVim

It's heavily based on the **[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/tree/master)** project. I strongly suggest to have a look at it. I created my own configuration based on it, added / removed some of the plugins and structured it to my personal preferences.

Markdown files are formatted with Prettier. Use `<leader>mp` in a Markdown buffer to toggle the browser preview.

The repository's Git and Ghostty config files are treated as TOML and formatted with Taplo.

### Tmux

### Ghostty

I don't have any specific reason to use this terminal to be honest, I tried out some of them and this one stuck with me for some reason.

## Shoutouts

Shoutout to some projects & people whose videos / plugins etc really helped setting this up

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [TJ DeVries](https://www.youtube.com/c/TJDeVries)
- [Folke](https://github.com/folke)
- [Dreams Of Code](https://www.youtube.com/@dreamsofcode)
