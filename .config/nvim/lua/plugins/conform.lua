return {
    "stevearc/conform.nvim",
    config = function()
        -- 'disable' formatting
        -- vim.keymap.set("n", "<Leader>q", ":lua require('conform').format({ async = true, lsp_fallback = true})<CR>")
        require("conform").setup({
            notify_on_error = true,
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },

                c = { "clang_format" },
                cpp = { "clang_format" },
            },
            formatters = {
                clang_format = {
                    args = { '--style', "{IndentWidth: 4, TabWidth: 4, UseTab: Never}" },
                },
            },
        })
    end
}
