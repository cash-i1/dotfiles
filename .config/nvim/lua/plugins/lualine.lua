return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        require("lualine").setup({
            options = {
                -- theme = "gruvbox"
                theme = "dracula"
                -- theme = "base16"
            }
        })
    end
}
