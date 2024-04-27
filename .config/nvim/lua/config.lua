-- Theme
vim.cmd("colorscheme moonfly")

-- Imports
require('luasnip.loaders.from_vscode').lazy_load()

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local toggleterm = require("toggleterm")
local neo_tree = require("neo-tree")
local neo_tree_command = require("neo-tree.command")
local treesitter = require("nvim-treesitter")
local treesitter_configs = require("nvim-treesitter.configs")
local telescope = require("telescope")
local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local luasnip = require("luasnip")
local auto_save = require("auto-save")

-- Options
vim.o.expandtab =          true
vim.o.tabstop =            4
vim.o.softtabstop =        4
vim.o.shiftwidth =         4
vim.o.conceallevel =       2
vim.o.clipboard =          "unnamedplus"
vim.o.relativenumber =     true
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.guifont =          { "JetBrainsMono Nerd Font", ":h14" }
vim.opt.signcolumn =       "no"
vim.opt.backup = true
vim.opt.backupdir =        os.getenv 'HOME' .. "/.cache/nvim/backup"
vim.opt.undofile = true
vim.opt.undodir = os.getenv 'HOME' ..  "/.cache/nvim/undo"

-- Keybinds
vim.keymap.set({'n', 'v', 'i'}, '<C-s>', '<cmd>wa<cr>')
vim.keymap.set("n", "<Leader>n", ":Neotree toggle<CR>")
-- vim.keymap.set("n", "<Esc>", ":q<CR>")
vim.keymap.set("n", "<Leader><Esc>", ":qa<CR>")
vim.keymap.set("n", "<Leader><Space>", ":qa<CR>")
vim.keymap.set("n", "<Leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>g", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>e", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>r", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
toggleterm.setup({ open_mapping = [[<c-/>]] })
cmp.setup({
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
})

-- Variables
local ensured_languages = {
    lsp =  { "lua_ls", "rust_analyzer" },
    treesitter = { "lua", "python", "rust" }
}
local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

-- Plugin Setup
toggleterm.setup({
    direction = "float",
    size = 55,
})

neo_tree.setup({
    window = {
        position = "left",
        width = 25,
    },
    filesystem = {
        bind_to_cwd = false;
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(_)
                neo_tree_command.execute({ action = "close" })
            end
        },
    }
})

treesitter_configs.setup({
    ensure_installed = ensured_languages["treesitter"]
})

telescope.setup({
    defaults = {
        layout_config = {
            horizontal = {
                size = {
                    width = "80%"
                }
            }
        }
    }
})

auto_save.setup({
    enabled = true
})

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = ensured_languages["lsp"]
})

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
        hover = cmp.config.window.bordered(),
    },
    sources = {
        { name = "nvim_lsp", max_item_count = 10},
        { name = "buffer", max_item_count = 10},
    },
})

-- Misc
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})

for _, server in ipairs(ensured_languages["lsp"]) do
    lspconfig[server].setup({
        capabilities = lsp_capabilities,
    })
end

lspconfig.rust_analyzer.setup({
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false;
            }
    	}
    }
})

