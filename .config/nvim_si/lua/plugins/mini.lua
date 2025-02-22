return {
    'echasnovski/mini.nvim',
    version = "*",
    config = function ()
        require("mini.files").setup()
        require("mini.statusline").setup()
        require("mini.comment").setup({
            options = {
                custom_commentstring = function ()
                    if vim.bo.filetype == "c" then
                        return "// %s"
                    end
                    return nil
                end,
            }
        })
    end
}
