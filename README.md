# dotfiles
This github repo has all of my dotfiles.

> _Also my nvim config is probably sub optimal._

**also i remade everything from scratch so it should work**

## Notes
- You might need to download some stuff for all the configs to work. this is a list of the ones i can think of right now:
    - ripgrep (for telescope live grep search in nvim)
    - JetBrains mono bold and extra bold (for kitty, you might need to change the settings to use the right font you downloaded which should be listed in the `kitty +list-fonts` command)
- You might need to rename 'Code - OSS' to 'vscode' (or something similar) if you are using a different versin of vscode.

## Installation
run this one liner and it should work (not tested). **requires GNU Stow**
`cd; git clone https://github.com/cash-i1/dotfiles.git .dotfiles; cd .dotfiles; stow .`

