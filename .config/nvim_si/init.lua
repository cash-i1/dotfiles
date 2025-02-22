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
--

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

vim.keymap.set("n", "<leader><leader>", ":source ~/.config/nvim_si/init.lua<CR>")
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-j>", ":bprev<CR>")

local cmp = require("cmp")
local luasnip = require("luasnip")

local mappings = cmp.get_config().mapping or {}

mappings["<C-b>"] = cmp.mapping.scroll_docs(-4)
mappings["<C-f>"] = cmp.mapping.scroll_docs(4)

mappings["<C-k>"] = cmp.mapping(function(fallback)
    cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })(fallback)
end, { "i", "s" })

mappings["<C-k>"] = cmp.mapping(function(fallback)
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end, { "i", "s" })

mappings["<C-j>"] = cmp.mapping(function(fallback)
    cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })(fallback)
end, { "i", "s" })

mappings["<C-j>"] = cmp.mapping(function(fallback)
    if luasnip.jumpable(1) then
        luasnip.jump(1)
    else
        fallback()
    end
end, { "i", "s" })

mappings["<CR>"] = cmp.mapping.confirm({ select = true })

cmp.setup({
    mapping = mappings
})
