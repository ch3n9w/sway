Lsp_plugins = {}

Lsp_plugins.plugins = {
    -- concrete syntax tree for source file
    {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'},

    -- LSP support
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    'williamboman/nvim-lsp-installer',
    -- code action
    -- NOTE: the creator of lspsaga is in hospital and stop maintaining
    'tami5/lspsaga.nvim',
    -- completion icon set
    -- 'onsails/lspkind-nvim',
    'ray-x/lsp_signature.nvim',
}

function Lsp_plugins.load()

    local nvim_treesitter = require('nvim-treesitter.configs')
    local lspconfig = require('lspconfig')
    local lsp_signature = require('lsp_signature')
    local lspinstall = require('nvim-lsp-installer')

    local lspsaga = require('lspsaga')

    local lspkind = require('lspkind')
    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol', -- show only symbol annotations
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            }),
        },
        mapping = {
            ['<C-e>'] = cmp.mapping.close(),
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
        })
    })
    lspsaga.init_lsp_saga()

    lsp_signature.setup({
        hint_prefix = " "
    })


    -- vim.api.nvim_command('autocmd CursorHold * Lspsaga show_line_diagnostics')

    nvim_treesitter.setup {
        ensure_installed = "maintained",
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }



    vim.o.completeopt='menu,menuone,noselect'


    -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())



    lspinstall.on_server_ready(function(server)
        -- if server.name == 'jdtls' then
        -- xxx
        -- elseif then
        -- else
        -- end
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
        else 
            server:setup({
                capabilities = capabilities,
                single_file_mode = true
            })
        end
    end)
end
return Lsp_plugins
