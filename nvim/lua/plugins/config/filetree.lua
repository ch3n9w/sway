M = function()
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

    -- vsplit and close filetree
    local function custom_vsplit()
        local node = require('nvim-tree.lib').get_node_at_cursor()
        nt_api.node.open.vertical(node)
        nt_api.tree.toggle()
    end

    -- split
    local function custom_split()
        local node = require('nvim-tree.lib').get_node_at_cursor()
        nt_api.node.open.horizontal(node)
    end

    -- require'nvim-tree'.on_enter()
    require 'nvim-tree'.setup {
        disable_netrw       = true,
        hijack_netrw        = true,
        open_on_tab         = true,
        hijack_cursor       = true,
        update_cwd          = true,
        sync_root_with_cwd  = true,
        view                = {
            width = 20,
            side = 'left',
            preserve_window_proportions = true,
            mappings = {
                list = {
                    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "nvimtreexdgopen", action_cb = NvimTreeXdgOpen, },
                    { key = { "v" }, action = "custom_vsplit", action_cb = custom_vsplit },
                    { key = { "s" }, action = "custom_split", action_cb = custom_split },
                }
            },
        },
        filters             = { custom = { "^\\." } },
        update_focused_file = { enable = true, },
        renderer            = { highlight_opened_files = "all" }

    }

end

return M
