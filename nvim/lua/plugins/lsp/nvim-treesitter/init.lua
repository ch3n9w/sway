M = {}
M.load = function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = { "rust", "go", "c", "python", "php", "html", "json", "css", "lua", "bash", "markdown",
            "javascript", "typescript", "norg" },
        highlight = {
            enable = true,
        },
        textobjects = {
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@parameter.outer",
                    ["]]"] = { query = "@class.outer", desc = "Next class start" },
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },
    }
end
return M
