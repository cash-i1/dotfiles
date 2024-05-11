return {
    {
        "akinsho/toggleterm.nvim", 
        version = "*",
        config = function()
            require("toggleterm").setup({ 
                open_mapping = [[<c-/>]],
                direction = "float",
                size = 55,

            })
        end,
    },
}

