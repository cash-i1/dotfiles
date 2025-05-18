return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    -- some of the mapping shit was made by chatgpt, sorry.
    -- i should use blink.cmp instead
    config = function()
        local has_words_before = function()
            -- lua lsp says its deprectated but it works so fuck that
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and
            vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local luasnip = require("luasnip")

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )
-- TODO: get rid of mason. use system install of lsp's
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                -- "nim_langserver",
                -- "nimlsp",
            },
            handlers = {
                function(server_name)
                    -- TODO: you dont need this everything is in s.settings
                    --       anyway
                    -- using this table so i can add random edge cases in
                    local s = {}
                    s.capabilities = capabilities
                    s.settings = {}

                    if server_name == "rust-analyzer" then
                        s.settings["rust-analyzer"] = {
                            diagnostics = {
                                enable = true
                            }
                        }
                    end

                    if server_name == "nimlangserver" then
                        s.cmd = { "nimlangserver" }
                    end

                    if server_name == "pylsp" then
                        s.settings["pylsp"] = {
                            plugins = {
                                pycodestyle = {
                                    enabled = false
                                }
                            }
                        }
                    end

                    if server_name == "lua_ls" then
                        s.settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    end

                    require("lspconfig")[server_name].setup(s)
                end,
            }
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = 'path', option = { show_hidden = true } },
                { name = 'nvim_lsp' }, { name = "luasnip" },
                { name = 'buffer' },
            }),
            mapping = {
                ["<A-l>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<A-h>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),

                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),

                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }
        })

        vim.diagnostic.config({
            signs = false,
            update_in_insert = true,
            virtual_text = {
                spacing = 2,
                prefix = ">"
                -- prefix = "■",
            },
        })
    end
}
