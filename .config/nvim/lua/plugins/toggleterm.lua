return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- TODO: put this in init.lua?
            open_mapping = [[<c-/>]],
            direction = "right",
            size = 55,
        })
    end,
}
