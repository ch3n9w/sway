M = {}
M.load = function()
    local trans
    -- if start nvim-qt with NVIM_GUI=1, then the background will not be transparent
    if os.getenv("NVIM_GUI") == "1" then
        trans = false
    else
        trans = true
    end

    require("tokyonight").setup({
        style = "storm",
        transparent = trans,
        terminal_colors = true,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            sidebars = "transparent",
            floats = "transparent",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.1,
        hide_inactive_statusline = false,
        dim_inactive = true,
        lualine_bold = true,

        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
    })

    vim.cmd [[colorscheme tokyonight]]

    require('lualine').setup {
        options = {
            theme = 'tokyonight'
        }
    }

end
return M
