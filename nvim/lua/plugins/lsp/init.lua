Lsp_plugins = {}

Lsp_plugins.plugins = {
    -- concrete syntax tree for source file
    {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'},

    -- LSP support
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    -- orgmode !!!
    {'nvim-neorg/neorg', tag="0.0.12"},

    'williamboman/nvim-lsp-installer',
    -- debug for golang, need pacman -S delve
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
    -- code action
    'glepnir/lspsaga.nvim',
    -- completion icon set
    'onsails/lspkind-nvim',
    'ray-x/lsp_signature.nvim',
}

function Lsp_plugins.load()

    local nvim_treesitter = require('nvim-treesitter.configs')
    local lspconfig = require('lspconfig')
    local lsp_signature = require('lsp_signature')
    local lspinstall = require('nvim-lsp-installer')

    local lspsaga = require('lspsaga')

    local lspkind = require('lspkind')

    local dap, dapui = require("dap"), require("dapui")
    require("dapui").setup({
        layouts = {
            {
                elements = {
                    { id = "scopes", size = 0.1 },
                },
                size = 7,
                position = "bottom",
            },
        }
    })
    require("dap-go").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
        vim.cmd("NvimTreeClose")
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol', -- show only symbol annotations
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            }),
        },
        mapping = {
            ['<Esc>'] = cmp.mapping.close(),
            ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's'})
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        }, {
            { name = 'buffer' },
            { name = 'neorg' },
        })
    })
    lspsaga.init_lsp_saga()

    lsp_signature.setup({
        hint_prefix = " "
    })

    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            ["core.norg.concealer"] = {}, -- icon support
            ["core.norg.manoeuvre"] = {}, -- move between different elements
            ["core.norg.completion"] = {
                config = {
                    engine = "nvim-cmp",
                },
            },
            ["core.norg.qol.toc"] = {}, -- TOC generate
            ["core.export"] = {},
        }
    }
    -- vim.api.nvim_command('autocmd CursorHold * Lspsaga show_line_diagnostics')

    nvim_treesitter.setup {
        ensure_installed = {"norg","rust","go","c","python","php","html","json","css","lua","bash","markdown"},
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }


    vim.o.completeopt='menu,menuone,noselect'


    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())



    lspinstall.on_server_ready(function(server)
        if server.name == 'intelephense' then
            server:setup({
                capabilities = capabilities,
                init_options = {
                    -- for intelephense
                    licenceKey='/home/ch4ser/.config/nvim/intelephense_license_key',
                    globalStoragePath='/home/ch4ser/.config',
                },
                single_file_mode=true
            })
        elseif server.name == 'pyright' then
            server:setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = 'workspace',
                            typeCheckingMode = 'off'
                        },
                    },
                },
            })

        else
            server:setup({
                capabilities = capabilities,
                single_file_mode = true
            })
        end
    end)
end
return Lsp_plugins
