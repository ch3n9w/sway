M = function()
    require('lspsaga').setup({
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
