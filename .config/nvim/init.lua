-- Set Variables
vim.o.expandtab =          true
vim.o.tabstop =            4
vim.o.softtabstop =        4
vim.o.shiftwidth =         4
vim.o.conceallevel =       2
vim.o.clipboard =          "unnamedplus"
vim.o.relativenumber =     true
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
-- Set Font
vim.opt.guifont =       { "JetBrainsMono Nerd Font", ":h14" }
vim.g.mapleader =       "," 
vim.g.maplocalleader =  ",," 

-- Mappings
vim.keymap.set({'n', 'v', 'i'}, '<C-s>', '<cmd>wa<cr>')

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- Theme
vim.cmd("colorscheme moonfly")

-- Load Config
require("configs")
