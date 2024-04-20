return {
    { "bluz71/vim-moonfly-colors" },
    { "akinsho/toggleterm.nvim", version = "*", config = true},
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    { "nvim-treesitter/nvim-treesitter" },
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.6',
        dependencies = { "nvim-lua/plenary.nvim" }
    },


    -- LSP Plugins
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
}
