return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "wgsl", "lua", "python", "rust", "cpp", "html", "gdscript", "c_sharp", "zig" },

                -- highlight = { enable = true },
                highlight = {
                    additional_vim_regex_highlighting = true,
                    enable = true,
                }
            })
        end
    },
}
