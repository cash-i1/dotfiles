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
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pylsp", "zls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = "williamboman/mason-lspconfig.nvim",
        config = function()
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_config = require("lspconfig")

            lsp_config.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })
            lsp_config.pylsp.setup({})
            -- lsp_config.omnisharp.setup({})
            -- lsp_config.wgsl_analyzer.setup({})
            -- lsp_config.pyright.setup({})
            lsp_config.clangd.setup({})
            -- lsp_config.tsserver.setup({})
            lsp_config.zls.setup({})
            -- lsp_config.gdscript.setup { on_attach = on_attach, flags = { debounce_text_changes = 150, } }

            lsp_config.rust_analyzer.setup({
                capabilities = lsp_capabilities,
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = true,
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
            local luasnip = require("luasnip")
            cmp.setup({
                mapping = {
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                    -- hover = cmp.config.window.bordered(),
                },
                sources = {
                    { name = "path",     priority = 10 },
                    { name = "nvim_lsp", },
                    { name = "nvim_lua", },
                    { name = "buffer", },
                    { name = "luasnip",  priority = -10 },
                },

            })
        end
    },

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",

}
