return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "^ext/",
                },
                -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#use-terminal-image-viewer-to-preview-images
                preview = {
                    mime_hook = function(filepath, bufnr, opts)
                        local is_image = function(filepath)
                            local image_extensions = {'png','jpg'}   -- Supported image formats
                            local split_path = vim.split(filepath:lower(), '.', {plain=true})
                            local extension = split_path[#split_path]
                            return vim.tbl_contains(image_extensions, extension)
                        end
                        if is_image(filepath) then
                            local term = vim.api.nvim_open_term(bufnr, {})
                            local function send_output(_, data, _ )
                                for _, d in ipairs(data) do
                                    vim.api.nvim_chan_send(term, d..'\r\n')
                                end
                            end
                            vim.fn.jobstart(
                                {
                                    'catimg', filepath  -- Terminal image viewer command
                                }, 
                                {on_stdout=send_output, stdout_buffered=true, pty=true})
                            else
                                require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
                            end
                        end
                    },
                }
            })
        end
    }
