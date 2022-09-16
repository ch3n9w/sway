local theme_plugins = {}

theme_plugins.plugins = {
    'folke/tokyonight.nvim',
    -- 'projekt0n/github-nvim-theme',
    -- 'ishan9299/nvim-solarized-lua',
}


function theme_plugins.load()
    require("tokyonight").setup({
        style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "transparent", -- style for sidebars, see below
            floats = "transparent", -- style for floating windows
        },
        sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.1, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = true, -- dims inactive windows
        lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights = function(highlights, colors) end,
    })
    --[[ vim.g.tokyonight_style = "storm"
    vim.g.tokyonight_transparent = true
    vim.g.tokyonight_transparent_sidebar = true ]]
    vim.cmd[[colorscheme tokyonight]]

    -- solarized_flat.load_syntax(darkColors)
    -- solarized_flat.terminal_colors(darkColors)
    -- vim.g.solarized_termtrans = 1
    -- vim.cmd[[colorscheme solarized-flat]]
    -- require('lualine').setup{options={theme='tokyonight'}}
    require('lualine').setup{
        options = {
            theme = 'tokyonight'
        }
    }
    --[[ require("github-theme").setup({
        theme_style = "dark",
        function_style = "italic",
        sidebars = {"qf", "vista_kind", "terminal", "packer"},
        transparent = true,

        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        colors = {hint = "orange", error = "#ff0000"},

        -- Overwrite the highlight groups
        overrides = function(c)
            return {
                htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
                DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
                -- this will remove the highlight groups
                TSField = {},
            }
        end
    }) ]]

    -- vim.cmd[[hi! Normal ctermbg=none ctermfg=none guifg=none guibg=none guisp=none]]

    -- require('github-theme').setup({theme_style='dark_default'})

end

return theme_plugins
