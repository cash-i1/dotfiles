# dotfiles
## requirements
pacman packages:
```bash
sudo pacman -S \
    ttf-jetbrains-mono \
    unzip \
    git \
    fish \

    ripgrep \ # optional (for telescope)
    clang \ # optional (for clangd)
    stow \ # optional (for symlinking dotfiles)

```

## installation
run this one liner and it should work (not tested). **requires GNU Stow**
`cd; git clone https://github.com/cash-i1/dotfiles.git .dotfiles; cd .dotfiles; stow .`

