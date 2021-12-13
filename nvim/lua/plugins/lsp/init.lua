Lsp_plugins = {}

Lsp_plugins.plugins = {
    -- concrete syntax tree for source file
    'nvim-treesitter/nvim-treesitter',

    -- LSP support
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',

    'williamboman/nvim-lsp-installer',
    -- code action
    -- NOTE: the creator of lspsaga is in hospital and stop maintaining
    'tami5/lspsaga.nvim',
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
    local cmp = require('cmp')
    lspkind.init({
        with_text = true,
        preset = 'codicons',
        symbol_map = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "ﰠ",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "塞",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "פּ",
            Event = "",
            Operator = "",
            TypeParameter = ""
        },
    })
    cmp.setup({
        formatting = {
            format = lspkind.cmp_format(),
        },
        mapping = {
            ['<C-e>'] = cmp.mapping.close(),
            ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    -- print(fallback)
                    fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
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


    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())



    lspinstall.on_server_ready(function(server)
        -- if server.name == 'jdtls' then
        -- xxx
        -- elseif then
        -- else
        -- end

        server:setup({
            capabilities = capabilities,
            init_options = {
                -- for intelephense
                licenceKey='/home/ch4ser/.config/nvim/intelephense_license_key',
                globalStoragePath='/home/ch4ser/.config',
            },
            single_file_mode=true
        })
    end)
end
return Lsp_plugins
