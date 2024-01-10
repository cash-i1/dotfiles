return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()

        file_previewer = require("telescope.previewers").vim_buffer_cat.new
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new

        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<Leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>F', builtin.live_grep, {})

    end

}
