M = {}

M.load = function()
    local cmp = require('cmp')
    local compare = require('cmp.config.compare')
    local lspkind = require('lspkind')
    -- local luasnip = require 'luasnip'
    local border = {
        { "┌", "FloatBorder" },
        { "─", "FloatBorder" },
        { "┐", "FloatBorder" },
        { "│", "FloatBorder" },
        { "┘", "FloatBorder" },
        { "─", "FloatBorder" },
        { "└", "FloatBorder" },
        { "│", "FloatBorder" },
    }
    cmp.setup({
        completion = {
            -- highlight the first candidate
            completeopt = 'menu,menuone,noinsert',
        },
        window = {
            completion = {
                border = border,
                scrollbar = '║',
            },
            documentation = {
                border = 'rounded'
            }
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol',
                maxwidth = 50,
            }),
        },
        mapping = {
            ['<C-q>'] = cmp.mapping.close(),
            -- ['<C-y>'] = cmp.config.disable,
            -- press enter will select the first candidate
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            -- ['<Tab>'] = cmp.mapping(function(fallback)
            --     if luasnip.expand_or_jumpable() then
            --         luasnip.expand_or_jump()
            --     else
            --         fallback()
            --     end
            -- end, { 'i', 's' }),
            ['<Down>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<Up>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'luasnip' },
            { name = 'neorg' },
        }),
        -- completion items sorting
        sorting = {
            priority_weight = 1.0,
            comparators = {
                compare.offset,
                compare.exact,
                -- compare.scopes,
                compare.recently_used,
                compare.score,
                compare.locality,
                compare.kind,
                compare.sort_text,
                compare.length,
                compare.order,
            },
        }
    })
end
return M
