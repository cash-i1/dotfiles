return {
    'numToStr/Comment.nvim',
    config = function()
        require("Comment").setup({
            opleader = {
                -- Line-comment keymap
                line = '<Leader>w',
                -- Block-comment keymap
                -- block = '<Leader>w',
            },
            toggler = {
                line = '<Leader>w'
            }
        })
    end
}
