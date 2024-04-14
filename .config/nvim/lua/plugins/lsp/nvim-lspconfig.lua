return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            workspace = {
              checkThirdParty = false,
              telemetry = { enable = false },
              library = {
                "${3rd}/love2d/library"
              }
            }
        })
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })
        lspconfig.pylsp.setup({
            capabilities = capabilities,
  
        })
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })
        lspconfig.gdscript.setup {
            capabilities = capabilities,
            flags = {
              debounce_text_changes = 150,
            }
          }
            --[===[]] require('lspconfig').clangd.setup {
                capabilities = { offsetEncoding = 'utf-16' },
                root_dir = function(fname)
                    return vim.fs.dirname(vim.fs.find({
                        'src',
                        'Makefile',
                        'CMakeLists.txt',
                        '.git',
                    }, { upward = true, path = fname })[1])
                end,
                on_attach = function(_client, bufnr)
                    vim.lsp.inlay_hint(bufnr, true)
                end,
            }
        }) --]===]

        vim.opt.signcolumn = "no"

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
 
        -- vim.keymap.set("n", "<Leader>q", vim.lsp.diagnostic.show_line_diagnostics, {})

        vim.diagnostic.config({
            virtual_text = true, -- Turn off inline diagnostics
            update_in_insert = true,
        })

        -- vim.cmd('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')
        -- vim.o.updatetime = 1

        vim.api.nvim_set_keymap(
          'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', 
          { noremap = true, silent = true }
        )
        --[===[ vim.api.nvim_set_keymap(
          'n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>',
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
          { noremap = true, silent = true }
        ) --]===]
end
}
