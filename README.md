# dotfiles
## requirements
pacman packages:
```bash
sudo pacman -S \
    ttf-jetbrains-mono \
    ripgrep \ # optional (for telescope)
    clang \ # optional (for clangd)
    stow \ # optional (for symlinking dotfiles)
    unzip \
    git \
    fish \

```

## installation
run this one liner and it should work (not tested). **requires GNU Stow**
`cd; git clone https://github.com/cash-i1/dotfiles.git .dotfiles; cd .dotfiles; stow .`

