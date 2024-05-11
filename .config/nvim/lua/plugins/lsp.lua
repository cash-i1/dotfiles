return {
    -- LSP Plugins
    {
        "williamboman/mason.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = "williamboman/mason.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = "williamboman/mason-lspconfig.nvim",
        config = function()
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig").rust_analyzer.setup({
                capabilities = lsp_capabilities,
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = false;
                        }
                    }
                }
            })
        end
    },

    -- Completion Plugins
    {
        "hrsh7th/nvim-cmp",  
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = {
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
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
        end
    },
            
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    
}
