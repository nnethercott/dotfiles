# my dotfiles 🥱

Portable shell tools are installed by mise. Homebrew handles platform packages,
applications, and tools that are not available through mise. On a new machine,
enable the Brewfile install explicitly (Homebrew must already be installed):

```sh
chezmoi init \
    --apply https://github.com/nnethercott/dotfiles.git \
    --branch chezmoi-mise \
    --promptBool brew=true \
    --promptBool tmux=true
```
