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
    -- concurrency = vim.uv.available_parallelism(),
    checker = { enabled = false },
    change_detection = {
        enabled = false,
        notify = false,
    }
})

vim.cmd("colo ef-winter")

-- use `:h option-list` to see what these do
vim.opt.textwidth = 80
vim.opt.wrapmargin = 0
vim.opt.formatoptions:append("t")
vim.opt.linebreak = true
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
vim.opt.cmdwinheight = 1
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath('cache') .. "/backup"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('cache') .. "/undo"

local function map(mode, combo, what_to_do)
    vim.keymap.set(mode, combo, what_to_do, { noremap = true, silent = true })
end

-- note: completion binds are in lua/plugins/lsp.lua because fuck that plugin
map("n", "<leader>n", ":echo 'leave nvim and use a real file manager or just :e or telescope'<cr>")
map("n", "<leader>f", ":Telescope find_files<cr>")
map("n", "<leader>g", ":Telescope live_grep<cr>")
map("n", "<leader><leader>", ":Telescope buffers<cr>")
map("n", "<leader>d", ":lua vim.diagnostic.open_float()<cr>")
map("n", "<leader>e", ":lua vim.lsp.buf.hover()<cr>")
map("n", "<leader>r", ":lua vim.lsp.buf.definition()<cr>")
map("n", "<leader>a", ":lua vim.lsp.buf.rename()<cr>")
map("n", "<leader>c", ":lua vim.lsp.buf.code_action()<cr>")
map("n", "<leader>k", ":lua vim.lsp.buf.references()<cr>")

-- TODO: make a thing where it looks in the current
--       dir for a file named '.run' and runs the
--       command inside of it
-- map("n", "<leader><leader>", ":!make -j<CR>")

-- TODO: this doesnt work
map('c', '<c-h>', '<left>')
map('c', '<c-l>', '<right>')
map('c', '<c-k>', '<up>')
map('c', '<c-j>', '<down>')

map("n", "<s-l>", ":bnext<CR>")
map("n", "<s-h>", ":bprev<CR>")

