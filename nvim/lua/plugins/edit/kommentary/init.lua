
M = {}
M.load = function ()
    vim.g.kommentary_create_default_mappings = false
    require('kommentary.config').use_extended_mappings()
end

return M

