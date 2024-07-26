return {
    "stevearc/conform.nvim",
    config = function()
        vim.keymap.set("n", "<Leader>q", ":lua require('conform').format({ async = true, lsp_fallback = true})<CR>")
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
            }
        })
    end
}
