local Movement = {
    { 'n', 'w', ':w<CR>w' },
    { 'n', '<leader>h', '<C-w>h' },
    { 'n', '<leader>j', '<C-w>j' },
    { 'n', '<leader>k', '<C-w>k' },
    { 'n', '<leader>l', '<C-w>l' },
    { 'n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } },
    { 'n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } },
    { 'n', 'J', ':bprevious!<CR>' },
    { 'n', 'K', ':bnext!<CR>' },
    { 'n', 'H', ':bprevious!<CR>' },
    { 'n', 'L', ':bnext!<CR>' },
    -- only scroll 1/3 size of page
    { 'n', '<C-b>', math.floor(vim.fn.winheight(0) / 3) .. '<C-u>' },
    { 'n', '<C-j>', math.floor(vim.fn.winheight(0) / 3) .. '<C-d>' },
    { 'n', '<C-k>', math.floor(vim.fn.winheight(0) / 3) .. '<C-u>' },
    { 'v', '<C-j>', math.floor(vim.fn.winheight(0) / 3) .. '<C-d>' },
    { 'v', '<C-k>', math.floor(vim.fn.winheight(0) / 3) .. '<C-u>' },
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
    -- dont move cursor when back to normal mode
    { 'i', '<ESC>', '<C-O>:stopinsert<CR>' },
    { 'i', '<C-BS>', '<C-W>' },
    -- remember to configure alacritty with:
    -- - { key: Back, mods: Control, chars: "\x17"}
    { 'i', '\x17', '<C-W>' },

    { 'i', '<C-j>', '<ESC>o' },
    { 'i', '<C-k>', '<ESC>O' },
    -- { 'n', '<LeftRelease>', '<LeftRelease><cmd>startinsert<CR>'},
    { 'i', '<C-z>', '<cmd>undo<CR>' },
    { 'i', '<C-r>', '<cmd>redo<CR>' },
    { 'i', '<C-v>', '<cmd>put<CR>' },
    { 'n', '<C-v>', '<cmd>put<CR>' },
}

local Cmd = {
    { 'n', 'Q', 'q' },
    -- format code using lsp
    -- { 'n', 'g=', ':lua vim.lsp.buf.format()<CR>' },
    { 'n', 'g=', ':lua format_code()<CR>' },
    -- keep virtual mode after indent
    { 'v', '>', '>gv' },
    { 'v', '<', '<gv' },
}

-- keymaps that need plugin context are not include, like nvim-cmp
local Plugins = {
    bufdelete = {
        { 'n', 'q', ':write<CR>:Bdelete<CR>' },
        { 'v', 'q', ':write<CR>:Bdelete<CR>' },
        -- { 'n', 'q', ':lua quit_behavior()<CR>' },
        -- { 'v', 'q', ':lua quit_behavior()<CR>' },
    },
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
    comment = {
        {'v', '<C-_>', '<Plug>(comment_toggle_linewise_visual)'},
        {'v', '<C-/>', '<Plug>(comment_toggle_linewise_visual)'},
        { 'n', '<C-_>', '<Plug>(comment_toggle_linewise_current)' },
        { 'n', '<C-/>', '<Plug>(comment_toggle_linewise_current)' },
    },
    hop = {
        { 'n', 'm', ':HopWord<CR>' },
        { 'v', 'm', '<CMD>HopWord<CR>' },
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
        { 't', '<esc>', '<C-\\><C-n>:wincmd p<CR>' },

    },
    -- dap debug
    dap = {
        { 'n', '<F1>', ':lua require"dap".toggle_breakpoint()<CR>' },
        { 'n', '<F2>', ':lua require"dap".continue()<CR>' },
        { 'n', '<F3>', ':lua require"dap".step_into()<CR>' },
        { 'n', '<F4>', ':lua require"dap".step_over()<CR>' },
        { 'n', '<leader>d', ':lua require"dapui".toggle()<CR>' },
    },
    marks_nvim = {
        { 'n', 'MM', ':lua require"marks".toggle()<CR>' },
        { 'n', 'MJ', ':lua require"marks".next()<CR>' },
        { 'n', 'MK', ':lua require"marks".prev()<CR>' },
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
    -- vim.api.nvim_set_keymap(
    vim.keymap.set(
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

-- as clangd do not support formatting
function format_code()
    if vim.bo.filetype == "norg" then
        vim.cmd('execute \"normal gg=G\\<C-o>\"')
    else
        vim.lsp.buf.format()
    end
end

function quit_behavior()
    if #vim.api.nvim_list_wins() > 1 then
        vim.cmd('write')
        vim.cmd('q')
    else
        vim.cmd('write')
        vim.cmd('Bdelete')
    end
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

