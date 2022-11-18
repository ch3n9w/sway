local Movement = {
    { 'n', 'w', ':w<CR>w' },
    { 'n', '<leader>h', '<C-w>h' },
    { 'n', '<leader>j', '<C-w>j' },
    { 'n', '<leader>k', '<C-w>k' },
    { 'n', '<leader>l', '<C-w>l' },
    { 'n', 'J', ':bprevious!<CR>' },
    { 'n', 'K', ':bnext!<CR>' },
    { 'n', 'H', ':bprevious!<CR>' },
    { 'n', 'L', ':bnext!<CR>' },
    { 'n', '<C-b>', '<C-u>' },
    { 'n', '<C-j>', '<C-d>' },
    { 'n', '<C-k>', '<C-u>' },
    { 'n', '<PageUp>', '<C-u>' },
    { 'n', '<PageDown>', '<C-d>' },

    { 'i', '<C-h>', '<ESC>I' },
    { 'i', '<C-l>', '<ESC>A' },
    { 'n', '<C-h>', '<ESC>^' },
    { 'n', '<C-l>', '<ESC>$' },
    { 'n', '(', '<ESC>^' },
    { 'n', ')', '<ESC>$' },
    { 'v', '<C-l>', '$' },
    { 'v', '<C-h>', '^' },

    { 'i', '<C-Down>', '<C-O><C-E>' },
    { 'i', '<C-Up>', '<C-O><C-Y>' },
}

local Edit = {
    { 'i', '<C-BS>', '<C-W>' },

    { 'i', '<C-j>', '<ESC>o' },
    { 'i', '<C-k>', '<ESC>O' },
}

local Cmd = {
    { 'n', 'Q', 'q' },
    { 'n', 'q', ':write<CR>:Bdelete<CR>' },
    { 'v', 'q', ':write<CR>:Bdelete<CR>' },
    { 'n', 'g=', ':lua vim.lsp.buf.format()<CR>' },
}

local Plugins = {
    telescope = {
        { 'n', 'sw', ':Telescope grep_string<CR>' },
        { 'n', 'sf', ':Telescope find_files<CR>' },
    },
    nvim_tree = {
        { 'n', '<leader>t', ':NvimTreeToggle<CR>' },
        { 'n', '<leader>c', ':cd %:h<CR>' },
    },
    symbols_outline = {
        { 'n', '<leader>s', ':SymbolsOutline<CR>' },
    },
    kcommentary = {
        { 'n', '<C-_>', '<Plug>kommentary_line_default', {} },
        { 'v', '<C-_>', '<Plug>kommentary_visual_default<ESC>', {} },
        { 'n', '<C-/>', '<Plug>kommentary_line_default', {} },
        { 'v', '<C-/>', '<Plug>kommentary_visual_default<ESC>', {} },

    },
    hop = {
        { 'n', 'm', ':HopWord<CR>' },
    },
    lspsaga = {
        { 'n', 'ga', ':Lspsaga code_action<CR>', { silent = true } },
        { 'n', 'ge', ':Lspsaga show_line_diagnostics<CR>' },
        { 'n', 'gh', ':Lspsaga hover_doc<CR>' },
        { 'n', 'gs', ':Lspsaga signature_help<CR>' },
        { 'n', 'gr', ':Lspsaga rename<CR>' },
        { 'n', 'gd', ':Lspsaga peek_definition<CR>' },

    },
    -- bottom terminal
    toggleterm = {
        { 'n', 'ss', ':ToggleTerm size=8 direction=horizontal<CR>' },
        { 't', 'ss', '<C-\\><C-n>:ToggleTerm size=8 direction=horizontal<CR>' },
        { 't', '<esc>', '<C-\\><C-n>' },

    },
    -- dap debug
    dap = {
        { 'n', '<F1>', ':lua require"dap".toggle_breakpoint()<CR>' },
        { 'n', '<F2>', ':lua require"dap".continue()<CR>' },
        { 'n', '<F3>', ':lua require"dap".step_into()<CR>' },
        { 'n', '<F4>', ':lua require"dap".step_over()<CR>' },
        { 'n', '<leader>d', ':lua require"dapui".toggle()<CR>' },
    },
}
local Other = {
    mouse = {
        -- use mouse to manupulate folders
        { 'n', '<2-LeftMouse>', 'za' },
    }
}

-- key map function
local key_mapper = function(mode, key, result, config)
    if nil == config then
        config = { noremap = true, silent = true }
    end
    vim.api.nvim_set_keymap(
        mode,
        key,
        result,
        config
    )
end

function typora()
    local filename = vim.api.nvim_buf_get_name(0)
    vim.fn.system("typora " .. filename)
end

for _, keymap_class in ipairs({ Movement, Edit, Cmd, Other }) do
    for _, keymap in ipairs(keymap_class) do
        if keymap[4] ~= nil then
            key_mapper(keymap[1], keymap[2], keymap[3], keymap[4])
        else
            key_mapper(keymap[1], keymap[2], keymap[3])
        end
    end
end


for _, plugin_keymap in pairs(Plugins) do
    for _, keymap in ipairs(plugin_keymap) do
        if keymap[4] ~= nil then
            key_mapper(keymap[1], keymap[2], keymap[3], keymap[4])
        else
            key_mapper(keymap[1], keymap[2], keymap[3])
        end
    end

end

--[[ key_mapper('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
key_mapper('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true}) ]]


-- nvim-tree settings
--
-- a: add file
-- r: rename file folder
-- y: copy file or folder name
-- x: delete file or folder and add to clipboard
-- d: just delete
-- c: copy file or folder
-- p: paste file or folder
-- s: open file with default editor
-- <C-v>: will open the file in a vertical split, <C-q> can quit
-- <C-x>: will open the file in a horizontal split, <C-q> can quit





-- lspsaga keymap
-- key_mapper('n', 'gh', ':Lspsaga lsp_finder<CR>')
-- key_mapper('n', '<leader>ca', ':Lspsaga code_action<CR>')
-- key_mapper('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>')

-- key_mapper('n', 'gs', ':Lspsaga signature_help<CR>')


-- key_mapper('n', '<F5>', 'lua require"dap".toggle_breakpoint()<CR>')

-- nvim-cmp
-- <Tab>: jump to next


vim.api.nvim_create_user_command(
    "Typora",
    typora,
    { desc = "start typora" }
)
