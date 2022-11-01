M = {}
M.load = function ()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol',
                maxwidth = 50,
            }),
        },
        mapping = {
            -- ['<Esc>'] = cmp.mapping.close(),
            ['<C-y>'] = cmp.config.disable,
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
end
return M
