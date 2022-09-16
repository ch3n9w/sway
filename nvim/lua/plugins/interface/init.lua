local interface_plugins = {}

interface_plugins.plugins = {
    -- bufferline
    -- 'kyazdani42/nvim-web-devicons',
    'akinsho/bufferline.nvim',
    -- indent line
    'lukas-reineke/indent-blankline.nvim',
    -- statusline
    'hoob3rt/lualine.nvim',
    -- start interface
    -- 'goolord/alpha-nvim',
    -- bottom terminal
    'akinsho/toggleterm.nvim',
    'famiu/bufdelete.nvim',
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
}


function interface_plugins.load()
    require('bufferline').setup {
        options = {
            numbers = "buffer_id",
            close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
            middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
            -- NOTE: this plugin is designed with this icon in mind,
            -- and so changing this is NOT recommended, this is intended
            -- as an escape hatch for people who cannot bear it for whatever reason
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            indicator = {
                icon = '>', -- this should be omitted if indicator style is not 'icon'
                style = 'underline',
            },
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will *NOT* be fixed.
            name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
                -- remove extension from markdown files for example
                if buf.name:match('%.md') then
                    return vim.fn.fnamemodify(buf.name, ':t:r')
                end
            end,
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            tab_size = 18,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return "("..count..")"
            end,
            -- NOTE: this will be called a lot so don't do any heavy processing here
            custom_filter = function(buf_number)
                -- filter out filetypes you don't want to see
                if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                    return true
                end
                -- filter out by buffer name
                if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                    return true
                end
                -- filter out based on arbitrary rules
                -- e.g. filter out vim wiki buffer from tabline in your work repo
                if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                    return true
                end
            end,
            offsets = {{filetype = "NvimTree", text = "File Explorer"}},
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = false,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            enforce_regular_tabs = true,
            always_show_bufferline = true,
            sort_by = 'id'
        }
    }

    -- require'alpha'.setup(require'alpha.themes.startify'.opts)
    require("toggleterm").setup({
        shade_terminals = false
    })

    require'nvim-tree.events'.on_nvim_tree_ready(function ()
        vim.cmd("NvimTreeRefresh")
    end)
    -- require'nvim-tree'.on_enter()
    require'nvim-tree'.setup {
        disable_netrw        = true,
        hijack_netrw         = true,
        open_on_setup        = false,
        ignore_buffer_on_setup = false,
        ignore_ft_on_setup   = {},
        auto_reload_on_write = true,
        open_on_tab          = true,
        hijack_cursor        = true,
        update_cwd           = true,
        hijack_unnamed_buffer_when_opening = false,
        hijack_directories   = {
            enable = true,
            auto_open = true,
        },
        diagnostics = {
            enable = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            }
        },
        view = {
            width = 20,
            height = 30,
            hide_root_folder = false,
            side = 'left',
            preserve_window_proportions = true,
            mappings = {
                custom_only = false,
                list = {}
            },
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
        filters = { custom = { "^\\." } },
    }

    -- vim.cmd("autocmd BufEnter * if winwidth(0) > 100  | execute 'NvimTreeOpen' | execute 'NvimTreeFocus'| wincmd p | endif")

    function tree_toggle_on_setup()
        require'nvim-tree'.toggle(false,true)
    end

    if vim.fn.winwidth(0)>100 then
        vim.fn.timer_start(100, tree_toggle_on_setup)
    end

    vim.cmd("autocmd VimResized * if winwidth(0) > 100 | execute 'NvimTreeOpen' | execute 'NvimTreeFocus' | wincmd p | else | execute 'NvimTreeClose' | endif")


end

return interface_plugins
