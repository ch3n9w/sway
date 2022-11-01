M = {}
M.load = function ()
    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            ["core.norg.concealer"] = {},
            ["core.norg.manoeuvre"] = {},
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp",
                },
            },
            ["core.norg.qol.toc"] = {},
            ["core.export"] = {},
        }
    }
end
return M
