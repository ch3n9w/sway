M = function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = { "rust", "go", "c", "python", "php", "html", "json", "css", "lua", "bash", "markdown",
            "javascript", "typescript", "norg" },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = false,
            -- keymaps = {
            --     init_selection = '<CR>',
            --     node_incremental = '<CR>',
            --     node_decremental = '<BS>',
            --     scope_incremental = '<TAB>',
            -- }
        },
    }
end

return M
