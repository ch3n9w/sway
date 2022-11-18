
M = {}
M.load = function ()
    require('lspsaga').init_lsp_saga({
        code_action_keys = {
            quit = '<ESC>',
            exec = '<CR>',
        },
        definition_action_keys = {
            edit = '<CR>',
            vsplit = 'v',
            quit = '<ESC>',
        },
        rename_action_quit = '<ESC>',
    })
end
return M
