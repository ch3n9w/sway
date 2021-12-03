local sideview_plugins = {}

sideview_plugins.plugins = {
    -- file explorer tree
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
    -- code structure tree view
    'simrat39/symbols-outline.nvim'
}

function sideview_plugins.load_filetree()
end

function sideview_plugins.load()
    require'nvim-tree'.setup {
        -- disables netrw completely
        disable_netrw       = false,
        -- hijack netrw window on startup
        hijack_netrw        = true,
        -- open the tree when running this setup function
        open_on_setup       = true,
        -- will not open on setup if the filetype is in this list
        ignore_ft_on_setup  = {},
        -- closes neovim automatically when the tree is the last **WINDOW** in the view
        auto_close          = true,
        -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
        open_on_tab         = true,
        -- hijacks new directory buffers when they are opened.
        update_to_buf_dir   = {
            -- enable the feature
            enable = true,
            -- allow to open the tree if it was previously closed
            auto_open = true,
        },
        -- hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor       = false,
        -- updates the root directory of the tree on `DirChanged` (when you run `:cd` usually)
        update_cwd          = false,
        -- show lsp diagnostics in the signcolumn
        diagnostics = {
            enable = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            }
        },
        -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
        update_focused_file = {
            -- enables the feature
            enable      = false,
            -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
            -- only relevant when `update_focused_file.enable` is true
            update_cwd  = false,
            -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
            -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
            ignore_list = {}
        },
        -- configuration options for the system open command (`s` in the tree by default)
        system_open = {
            -- the command to run this, leaving nil should work in most cases
            cmd  = nil,
            -- the command arguments as a list
            args = {}
        },

        view = {
            -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
            width = 30,
            -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
            height = 30,
            -- Hide the root path of the current folder on top of the tree 
            hide_root_folder = false,
            -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
            side = 'left',
            -- if true the tree will resize itself after opening a file
            auto_resize = false,
            mappings = {
                -- custom only false will merge the list with the default mappings
                -- if true, it will only use your list to set the mappings
                custom_only = false,
                -- list of mappings to set on the tree manually
                list = {}
            }
        }
    }

    vim.g.nvim_tree_quit_on_open = 1
    vim.g.nvim_tree_indent_markers = 1 
    vim.g.nvim_tree_git_hl = 1 
    vim.g.nvim_tree_highlight_opened_files = 1 
    vim.g.nvim_tree_root_folder_modifier = ':~'
    vim.g.nvim_tree_add_trailing = 1 
    vim.g.nvim_tree_group_empty = 1 
    vim.g.nvim_tree_disable_window_picker = 1 
    vim.g.nvim_tree_icon_padding = ' ' 
    vim.g.nvim_tree_symlink_arrow = ' >> ' 
    vim.g.nvim_tree_respect_buf_cwd = 1 
    vim.g.nvim_tree_create_in_closed_folder = 0
    vim.g.nvim_tree_refresh_wait = 500 
    vim.g.nvim_tree_window_picker_exclude = {
        filetype = {
            'notify',
            'packer',
            'qf'
        },
        buftype = {
            'terminal'
        }
    }
    vim.g.nvim_tree_show_icons = {
        git= 1,
        folders= 0,
        files= 0,
        folder_arrows= 0,
    }
    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged= "✗",
            staged= "✓",
            unmerged= "",
            renamed= "➜",
            untracked= "★",
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
        }
    }



    require('symbols-outline').setup{}


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
vim.g.nvim_tree_indent_markers = 1
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
