local sideview_plugins = {}

sideview_plugins.plugins = {
    -- file explorer tree
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
    -- code structure tree view
    'simrat39/symbols-outline.nvim'
}

function sideview_plugins.load()
    require('symbols-outline').setup{}
    require('nvim-tree').setup{}

    
    vim.g.symbols_outline = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = true,
        position = 'right',
        width = 25,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
            close = {"<Esc>", "q"},
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            rename_symbol = "r",
            code_actions = "a",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
            File = {icon = "", hl = "TSURI"},
            Module = {icon = "", hl = "TSNamespace"},
            Namespace = {icon = "", hl = "TSNamespace"},
            Package = {icon = "", hl = "TSNamespace"},
            Class = {icon = "𝓒", hl = "TSType"},
            Method = {icon = "ƒ", hl = "TSMethod"},
            Property = {icon = "", hl = "TSMethod"},
            Field = {icon = "", hl = "TSField"},
            Constructor = {icon = "", hl = "TSConstructor"},
            Enum = {icon = "ℰ", hl = "TSType"},
            Interface = {icon = "ﰮ", hl = "TSType"},
            Function = {icon = "", hl = "TSFunction"},
            Variable = {icon = "", hl = "TSConstant"},
            Constant = {icon = "", hl = "TSConstant"},
            String = {icon = "𝓐", hl = "TSString"},
            Number = {icon = "#", hl = "TSNumber"},
            Boolean = {icon = "⊨", hl = "TSBoolean"},
            Array = {icon = "", hl = "TSConstant"},
            Object = {icon = "⦿", hl = "TSType"},
            Key = {icon = "", hl = "TSType"},
            Null = {icon = "NULL", hl = "TSType"},
            EnumMember = {icon = "", hl = "TSField"},
            Struct = {icon = "𝓢", hl = "TSType"},
            Event = {icon = "🗲", hl = "TSType"},
            Operator = {icon = "+", hl = "TSOperator"},
            TypeParameter = {icon = "𝙏", hl = "TSParameter"}
        }
    }

        -- open nvim_tree and locate to editor
    --[[ vim.cmd("autocmd VimEnter * NvimTreeToggle")
    vim.cmd("autocmd VimEnter * wincmd l") ]]
    
    -- vim.cmd("autocmd VimEnter * NvimTreeToggle")
    vim.g.nvim_tree_auto_open = 1
    vim.g.nvim_tree_auto_close = 1
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_hide_dotfiles = 0
    vim.g.nvim_tree_tab_open = 1
    vim.g.nvim_tree_show_icons = {
        git= 1,
        folders =  1,
        files = 1,
        folder_arrows = 1,
    }
    vim.g.nvim_tree_icons = {
        default= '',
        symlink= '',
        git= {
            unstaged = "✗",
            staged = "✓",
            unmerged="",
            renamed= "➜ ",
            untracked= "★ ",
            deleted= "",
            ignored= "◌"
        },
        folder= {
            arrow_open= "",
            arrow_closed= "",
            default= "",
            open= "",
            empty= "",
            empty_open= "",
            symlink= "",
            symlink_open= "",
        },
        lsp= {
            hint= "",
            info= "",
            warning= "",
            error= "",
        }
    }
    
end




return sideview_plugins