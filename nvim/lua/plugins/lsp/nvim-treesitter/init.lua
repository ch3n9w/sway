M = {}
M.load = function ()
    require('nvim-treesitter.configs').setup {
        ensure_installed = {"rust","go","c","python","php","html","json","css","lua","bash","markdown","javascript","typescript"},
        highlight = {
            enable = true,
        },
    }
end
return M
