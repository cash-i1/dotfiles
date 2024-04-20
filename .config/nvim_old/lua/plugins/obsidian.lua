return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use the latest release instead of the latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      follow_url_func = function(url)
        vim.fn.system({"xdg-open", url})
      end,
      disable_frontmatter = false,
      workspaces = {
        {
          name = "notes",
          -- Use the home directory shortcut "~/" instead of the absolute path
          path = "~/notestest",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
        new_notes_location = "current_dir",
        prepend_note_id = true,
        prepend_note_path = false,
        use_path_only = false,
      },
      mappings = {
        ["<CR>"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<S-Enter>"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        ["<C-o>"] = {
          action = function()
            vim.cmd("ObsidianSearch")
          end,
          opts = { buffer = true },
        },
      },
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
            return title

        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

    })
  end
}
