
local edit_plugins = {}

edit_plugins.plugins = {
    -- comment tool
    'b3nj5m1n/kommentary',
    'folke/todo-comments.nvim',
    -- autopair
    'windwp/nvim-autopairs',
    -- easymotion
    'phaazon/hop.nvim',
    'nvim-telescope/telescope.nvim',
    -- paste image from clipboard
    'ekickx/clipboard-image.nvim',
    -- 'askfiy/nvim-picgo',
    -- dependencies
    'nvim-lua/plenary.nvim',
    'abecodes/tabout.nvim',
    -- IME
    -- 'tonyfettes/fcitx5.nvim',
}

function edit_plugins.load()
    vim.g.kommentary_create_default_mappings = false
    require('kommentary.config').use_extended_mappings()

    require('nvim-autopairs').setup{}

    require("todo-comments").setup {}
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    require('telescope').setup{}

    require('clipboard-image').setup{
        markdown = {
            img_dir = function() return "/home/ch4ser/Documents/NOTES/.images/" .. vim.fn.expand('%:t:r') end,
            -- img_dir = function() return "./images/" .. vim.fn.expand('%:t:r') end,
            img_dir_txt = function() return vim.fn.expand('%:t:r') end,
            img_name = function() return os.date('%y-%m-%d-%H-%M-%S') end,
            affix = "![](~/Documents/NOTES/.images/%s)"
        }
    }
    --[[ require("nvim-picgo").setup{
        notice = "echo",
    } ]]
    require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
            {open = "'", close = "'"},
            {open = '"', close = '"'},
            {open = '`', close = '`'},
            {open = '(', close = ')'},
            {open = '[', close = ']'},
            {open = '{', close = '}'}
        },
        ignore_beginning = false, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
    }

    --[[ require'fcitx5'.setup = {
        ui = {
            separator = '',
            padding = { left = 1, right = 1 }
        },
    } ]]
end

return edit_plugins
