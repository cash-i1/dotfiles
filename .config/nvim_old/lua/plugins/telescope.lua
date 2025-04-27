return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.6',
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- local telescope = require("telescope") -- unused
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    layout_config = {
                        horizontal = {
                            size = {
                                width = "80%"
                            }
                        }
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                }
            })
        end
    }

}
