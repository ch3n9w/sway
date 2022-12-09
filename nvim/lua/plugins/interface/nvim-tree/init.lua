M = {}
M.load = function()


    local nt_api = require("nvim-tree.api")
    require 'nvim-tree.events'.on_nvim_tree_ready(function()
        vim.cmd("NvimTreeRefresh")
    end)

    -- open pdf with xdg-open
    local function NvimTreeXdgOpen()
        local lib = require 'nvim-tree.lib'
        local node = lib.get_node_at_cursor()
        if node.extension == "pdf" then
            vim.fn.jobstart("xdg-open '" .. node.absolute_path .. "' &", { detach = true })
        else
            nt_api.node.open.edit(node)
        end
    end

    -- require'nvim-tree'.on_enter()
    require 'nvim-tree'.setup {
        disable_netrw                      = true,
        hijack_netrw                       = true,
        open_on_setup                      = false,
        ignore_buffer_on_setup             = false,
        ignore_ft_on_setup                 = {},
        auto_reload_on_write               = true,
        open_on_tab                        = true,
        hijack_cursor                      = true,
        update_cwd                         = true,
        sync_root_with_cwd                 = true,
        hijack_unnamed_buffer_when_opening = false,
        hijack_directories                 = {
            enable = true,
            auto_open = true,
        },
        diagnostics                        = {
            enable = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            }
        },
        view                               = {
            width = 20,
            hide_root_folder = false,
            side = 'left',
            preserve_window_proportions = true,
            mappings = {
                list = {
                    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "nvimtreexdgopen", action_cb = NvimTreeXdgOpen, },
                }
            },
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
        filters                            = { custom = { "^\\." } },
        update_focused_file                = {
            enable      = true,
            update_cwd  = false,
            ignore_list = {}
        },
        renderer                           = {
            highlight_opened_files = "all"
        }

    }

    -- vim.cmd("autocmd BufEnter * if winwidth(0) > 100  | execute 'NvimTreeOpen' | execute 'NvimTreeFocus'| wincmd p | endif")

    function tree_toggle_on_setup()
        require 'nvim-tree'.toggle(false, true)
    end

    if vim.fn.winwidth(0) > 100 then
        vim.fn.timer_start(100, tree_toggle_on_setup)
    end

    vim.cmd("autocmd VimResized * if winwidth(0) > 100 | execute 'NvimTreeOpen' | execute 'NvimTreeFocus' | wincmd p | else | execute 'NvimTreeClose' | endif")

end


return M
