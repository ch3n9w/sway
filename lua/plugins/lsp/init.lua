Lsp_plugins = {}

Lsp_plugins.plugins = {
    -- concrete syntax tree for source file
    'nvim-treesitter/nvim-treesitter',

    -- LSP support
    'neovim/nvim-lspconfig',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/nvim-cmp',

    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    -- 'williamboman/nvim-lsp-installer',
    -- deperate but still in use
    'kabouzeid/nvim-lspinstall',
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
    -- local lspinstall = require('nvim-lsp-installer')
    local lspinstall = require('lspinstall')

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
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
        },
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        }, {
            { name = 'buffer' },
        })
    })
    lspsaga.init_lsp_saga()

    lsp_signature.setup({
        hint_prefix = " "
    })

    vim.api.nvim_command('autocmd CursorHold * Lspsaga show_line_diagnostics')

    nvim_treesitter.setup {
        ensure_installed = "maintained",
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }



    vim.o.completeopt='menu,menuone,noselect'


    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    lspinstall.setup()
    local servers = lspinstall.installed_servers()
    for _, lsp in pairs(servers) do
        lspconfig[lsp].setup {
            capabilities = capabilities,
        }
    end

    -- lspinstall.on_server_ready(function(server)
        --     server:setup({capabilities = capabilities,})
        --     vim.cmd [[ do User LspAttachBuffers ]]
        -- end)

    end

    return Lsp_plugins
