M = function ()
    vim.g.kommentary_create_default_mappings = false
    require('kommentary.config').use_extended_mappings()
    require('kommentary.config').configure_language("default", {
        prefer_single_line_comments = true,
    })
end

return M
