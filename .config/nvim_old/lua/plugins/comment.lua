return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                opleader = {
                    line = '<Leader>w',
                },
                toggler = {
                    line = '<Leader>w'
                }
            })
        end
    }
}
