return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            require("neo-tree").setup({
                window = {
                    position = "left",
                    width = 25,
                },
                filesystem = {
                    bind_to_cwd = false;
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = true,
                    },
                },
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function(_)
                            require("neo-tree.command").execute({ action = "close" })
                        end
                    },
                }
            })
        end
    }

}
