-- Map Leader Keys
-- has to be set before lazy is loaded
vim.g.mapleader = ","
vim.g.maplocalleader = ",,"

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

-- Load Plugins
require("lazy").setup("plugins", {
    change_detection = {
        notify = false,
    }
})

-- Config
-- Theme
vim.cmd("colorscheme moonfly")
-- vim.cmd("colorscheme lackluster-mint")
-- Imports
require('luasnip.loaders.from_vscode').lazy_load()

vim.g.zig_fmt_autosave = 0

vim.g.gruvbox_contrast_dark='hard'
vim.g.gruvbox_contrast_light='hard'

-- Options
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.conceallevel = 2
vim.o.clipboard = "unnamedplus"
vim.o.pumheight = 10

-- vim.o.relativenumber = true
vim.o.number = true
-- vim.g.loaded_netrw       = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.o.guifont = "JetBrainsMono Nerd Font:style=Bold,Bold Italic:h16"
vim.o.guifont = "JetBrainsMono Nerd Font:h16:b"
-- vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h14", ":b" }
-- vim.opt.guifont =          { "Roboto Mono Medium", ":h14" }
vim.opt.signcolumn = "no"
vim.opt.backup = true
vim.opt.backupdir = os.getenv 'HOME' .. "/.cache/nvim/backup"
vim.opt.undofile = true
vim.opt.undodir = os.getenv 'HOME' .. "/.cache/nvim/undo"
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Keybinds
vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>wa<cr>')
vim.keymap.set("n", "<Leader>n", ":Neotree toggle<CR>")
-- vim.keymap.set("n", "<Esc>", ":q<CR>")
vim.keymap.set("n", "<Leader><Esc>", ":qa<CR>")
vim.keymap.set("n", "<Leader><Space>", ":qa<CR>")
vim.keymap.set("n", "<Leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>g", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>e", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>r", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>a", ":lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>c", ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>k", ":lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>h", ":Emmet ", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>p", '"_', { noremap = true, silent = true })

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.wgsl",
    callback = function()
        vim.bo.filetype = "wgsl"
    end,
})

-- local function open_image_with_xdg_open()
--     local file = vim.api.nvim_buf_get_name(0)
--     local extension = file:match("^.+(%..+)$")
--     if extension == ".png" then
--         os.execute("feh " .. file)
--         vim.cmd('bwipeout')
--     end
-- end
--
-- vim.api.nvim_create_autocmd("BufReadCmd", {
--     pattern = "*.png",
--     callback = open_image_with_xdg_open,
-- })


-- local function set_tab_size(ft, tabsize)
--   vim.cmd('autocmd FileType ' .. ft .. ' setlocal tabstop=' .. tabsize .. ' shiftwidth=' .. tabsize)
-- end
--
-- set_tab_size('c', 2)
-- set_tab_size('cpp', 2)
-- set_tab_size('c++', 2)
-- set_tab_size('rust', 4)


vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.frag", "*.vert", "*.glsl", "*.vs", "*.fs"},
  callback = function()
    vim.bo.filetype = "glsl"
  end
})

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
