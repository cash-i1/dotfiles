# dotfiles
## requirements
brew packages:
```bash
brew install \
    font-jetbrains-mono-nerd-font \
    git \ # i think is installed automatically?
    fish \
    npm \
    catimg  # for telescope image preview

    ripgrep \ # optional (for telescope)
    clang \ # optional (for clangd)
    stow \ # optional (for symlinking dotfiles)
```

## installation
run this one liner and it should work (not tested). **requires GNU Stow**
`cd; git clone https://github.com/cash-i1/dotfiles.git .dotfiles; cd .dotfiles; stow .`

