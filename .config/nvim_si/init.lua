-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = ",,"

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    checker = { enabled = false },
    change_detection = {
        enabled = false,
        notify = false,
    }
})

vim.cmd("colo vscode")

-- use `:h option-list` to see what these do
vim.opt.colorcolumn = "80"
vim.opt.title = true
vim.opt.syntax = "ON"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.showcmd = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.wildmenu = true
vim.opt.pumheight = 8

local function map(mode, combo, what_to_do)
    vim.keymap.set(mode, combo, what_to_do, { noremap = true, silent = true })
end

-- note: completion binds are in lua/plugins/lsp.lua because fuck that plugin
map("n", "<leader>n", ":echo 'leave nvim and use a real file manager or just :e or telescope'<CR>")
map("n", "<leader>f", ":Telescope find_files<CR>")
map("n", "<leader>g", ":Telescope live_grep<CR>")
map("n", "<leader><leader>", ":Telescope buffers<CR>")
map("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>e", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>r", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>a", ":lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>c", ":lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>k", ":lua vim.lsp.buf.references()<CR>")

map('c', '<C-h>', '<left>')
map('c', '<C-l>', '<right>')

map("n", "<S-k>", ":bnext<CR>")
map("n", "<S-j>", ":bprev<CR>")

