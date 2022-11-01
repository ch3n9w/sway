local tokyonight = require('plugins.theme.tokyonight')
local theme_plugins = {}

theme_plugins.plugins = {
    'folke/tokyonight.nvim',
    -- 'projekt0n/github-nvim-theme',
    -- 'ishan9299/nvim-solarized-lua',
}


function theme_plugins.load()
    tokyonight.load()
    -- solarized_flat.load_syntax(darkColors)
    -- solarized_flat.terminal_colors(darkColors)
    -- vim.g.solarized_termtrans = 1
    -- vim.cmd[[colorscheme solarized-flat]]
    -- require('lualine').setup{options={theme='tokyonight'}}
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
