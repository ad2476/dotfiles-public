Dotfiles setup
==============

Inspiration from [ntsvetko](https://github.com/ntsvetko/dotfiles)

## External Dependencies

* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Patched powerline fonts](https://github.com/powerline/fonts)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [fzf](https://github.com/junegunn/fzf)
* [ag](https://github.com/ggreer/the_silver_searcher)

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
