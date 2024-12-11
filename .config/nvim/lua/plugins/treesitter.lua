return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "python", "rust", "cpp", "html", "zig", "glsl", "ruby", "go"},

                -- highlight = { enable = true },
                highlight = {
                    additional_vim_regex_highlighting = true,
                    enable = true,
                }
            })
        end
    },
}
