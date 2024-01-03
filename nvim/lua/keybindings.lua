-- Leader key
vim.g.mapleader = ','

-- ctrl+c to toggle insert and normal mode.
vim.api.nvim_set_keymap('i', '<D-c>', '<Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<D-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<D-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<D-z>', '<cmd>undo<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", '<D-S-Z>', '<cmd>redo<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>Neotree filesystem reveal left toggle=true<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', '<cmd>ToggleTerm direction=float<cr>', { noremap = true, silent = true })

require("toggleterm").setup {
    direction = 'float',
    open_mapping = [[<c-\>]],
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Leader>r", "<cmd>exit<CR>", { noremap = true, silent = true })
    end,
    close_on_exit = true,
  }