M = function()
    require('lspsaga').setup({
        ui = {
            border = 'solid',
            colors = {
                -- normal_bg = '',
            }
        },
        code_action = {
            keys = {
                quit = '<ESC>',
                exec = '<CR>',
            }
        },
        definition_action_keys = {
            edit = '<CR>',
            vsplit = 'v',
            quit = '<ESC>',
        },
        rename = {
            quit = '<ESC>',
            exec = '<CR>',
        },
        code_action_icon = "",
    })
end

return M
