return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", 
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- vim.keymap.set("n", "<Leader>n", ":Neotree toggle float current reveal_force_cwd<CR>", {})
        vim.keymap.set("n", "<Leader>n", ":Neotree toggle float<CR>", {})
--  reveal_force_cwd
        require('neo-tree').setup {
            window = {
                width = 20,
            },
            filesystem = {
                bind_to_cwd = false;
                hijack_netrw_behavior = "disabled",

                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            }
        }
    end
}


        --[===[
        config = function()
            vim.keymap.set("n", "<Leader>n", ":Neotree filesystem focus toggle left<CR>", {})
            require("neo-tree").setup({
                event_handlers = {
                    event = "file_opened",
                    handler = function(file_path)
                        vim.cmd("Neotree close")
                    end
                    }
                })
            
        end
        --]===]


