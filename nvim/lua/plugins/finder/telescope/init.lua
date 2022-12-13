M = {}
M.load = function()
    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<C-x>"] = actions.select_vertical,
                    ["<Tab>"] = actions.select_vertical,
                    ["<CR>"] = actions.select_default,
                }
            }
        },
    }
    require('telescope').load_extension('fzf')
end

return M
