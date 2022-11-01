M = {}
M.load = function ()
    require('lsp_signature').setup({ hint_prefix = " " })
end
return M
