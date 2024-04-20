return {
    { "bluz71/vim-moonfly-colors", lazy = false, priority = 1000 },
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
        { "williamboman/mason.nvim", lazy = false, priority = 1000 },
        { "williamboman/mason-lspconfig.nvim", dependencies = "williamboman/mason.nvim" },
        { "neovim/nvim-lspconfig", dependencies = "williamboman/mason-lspconfig.nvim" },
    },
    -- Completion Plugins
    {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
    }
}
