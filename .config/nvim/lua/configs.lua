-- Ensured languages. used in lsp.
ensured_languages = {
    lsp =  { "lua_ls" },
    treesitter = { "lua", "python", "rust" }
}

-- Keybinds
vim.keymap.set("n", "<Leader>n", ":Neotree toggle<CR>")
vim.keymap.set("n", "<Leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>g", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Plugin Config
require("toggleterm").setup({
    direction = "vertical",
    open_mapping = [[<c-/>]],
    size = 55,
})

require("neo-tree").setup({
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
          require("neo-tree.command").execute({ action = "close" })
        end
      },

    }
})

require("nvim-treesitter.configs").setup({
    ensure_installed = ensured_languages["treesitter"]
})

require("telescope").setup({
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

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = ensured_languages["lsp"]
})
require("lspconfig").lua_ls.setup({})

-- Other Configs
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
})
