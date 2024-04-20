return {
    "hrsh7th/nvim-cmp",
    config = function()
          local cmp = require('cmp')
          require("luasnip.loaders.from_vscode").lazy_load()

          cmp.setup({
            snippet = {
              expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },
            view = {
                entries = "wildmenu"
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp', max_item_count = 10 },
              --{ name = 'luasnip', max_item_count = 3 }, -- For luasnip users.
              --{ name = 'buffer', max_item_count = 5 },
            })
          })
    end
}
