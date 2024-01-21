vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set conceallevel=2")
-- vim.cmd("set autochdir")
vim.cmd("cd %:h")
vim.o.guifont ="JetBrains Mono:h14"
vim.cmd("set clipboard=unnamedplus")
vim.wo.relativenumber = true
vim.g.mapleader = "," 

-- vim.api.nvim_exec([[
--   augroup cdpwd
--     autocmd!
--     autocmd VimEnter * execute('lcd ' .. getcwd())
--   augroup END
-- ]], false)

-- autochdir = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

