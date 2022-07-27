Dotfiles setup
==============

Inspiration from [ntsvetko](https://github.com/ntsvetko/dotfiles)

## External Dependencies

* [neovim](https://github.com/neovim/neovim)
* [Patched powerline fonts](https://github.com/powerline/fonts)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) (Installed by script)
* [fzf](https://github.com/junegunn/fzf)
* [fd](https://github.com/sharkdp/fd)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [sheldon](https://github.com/rossmacarthur/sheldon)
* [bat](https://github.com/sharkdp/bat)
* [starship](https://starship.rs)
* [univeral-ctags](https://github.com/universal-ctags/ctags)

Along with the usual: `zsh`, `git`, `curl`/`wget`, etc.

## Optional Dependencies

Config files exist for some programs but these programs aren't _required_:

* `rxvt-unicode`
* `tmux`

## Font dependencies

These configs probably will use one of these fonts (with powerline patches):

* Inconsolata
* Source Code Pro
* Hack
* Liberation Mono

## Automated Setup

To set up dependencies, symlinks, and configurations, run `init/setup` followed by platform-specific
setup (found under `init/`).

After setup, you'll need to choose a tmux theme, configure any device-specific zsh settings,
and install neovim plugins (`:PlugInstall`).
