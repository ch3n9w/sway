--[[
_  _________   ____  __    _    ____  
| |/ / ____\ \ / /  \/  |  / \  |  _ \ 
| ' /|  _|  \ V /| |\/| | / _ \ | |_) |
| . \| |___  | | | |  | |/ ___ \|  __/ 
|_|\_\_____| |_| |_|  |_/_/   \_\_|    


]]

-- key map function
local key_mapper = function(mode, key, result, config)
    if nil == config then
        config = {noremap = true, silent = true}
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
    vim.fn.system("typora "..filename)
end

--[[ key_mapper('n', ')', '$')
key_mapper('v', ')', '$')
key_mapper('n', '(', '^')
key_mapper('v', '(', '^') ]]
key_mapper('n', 'q', '<ESC>:w<CR>:Bdelete<CR>')
key_mapper('v', 'q', '<ESC>:w<CR>:Bdelete<CR>')
key_mapper('n', 'w', ':w<CR>w')
key_mapper('n', '<leader>h', '<C-w>h')
key_mapper('n', '<leader>j', '<C-w>j')
key_mapper('n', '<leader>k', '<C-w>k')
key_mapper('n', '<leader>l', '<C-w>l')
key_mapper('n', '<leader>H', '<C-w>H')
key_mapper('n', '<leader>J', '<C-w>J')
key_mapper('n', '<leader>K', '<C-w>K')
key_mapper('n', '<leader>L', '<C-w>L')
key_mapper('n', 'J', ':bprevious!<CR>')
key_mapper('n', 'K', ':bnext!<CR>')
key_mapper('n', 'H', ':bprevious!<CR>')
key_mapper('n', 'L', ':bnext!<CR>')
key_mapper('n', '<C-b>', '<C-u>')
--[[ key_mapper('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
key_mapper('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true}) ]]


key_mapper('i', '<C-j>', '<ESC>o')
key_mapper('i', '<C-k>', '<ESC>O')
key_mapper('n', '<C-j>', '<C-d>')
key_mapper('n', '<C-k>', '<C-u>')

-- some bug here
--[[ key_mapper('i', '<C-h>', '<ESC>lF(i')
key_mapper('i', '<C-l>', '<ESC>f)a') ]]
key_mapper('i', '<C-h>', '<ESC>I')
key_mapper('i', '<C-l>', '<ESC>A')
key_mapper('n', '<C-h>', '<ESC>^')
key_mapper('n', '<C-l>', '<ESC>$')
key_mapper('v', '<C-l>', '$')
key_mapper('v', '<C-h>', '^')

-- use mouse to manupulate folders
key_mapper('n', '<2-LeftMouse>', 'za')

-- format shortcut
key_mapper('n', 'g=', 'gg=G<C-o>')

-- telescope file fuzzy finder
key_mapper('n','sw', ':Telescope grep_string<CR>')
key_mapper('n','sf', ':Telescope find_files<CR>')

-- nvim-tree settings
key_mapper('n', '<leader>t', ':NvimTreeToggle<CR>')
key_mapper('n', '<leader>c', ':cd %:h<CR>')

-- symbol outline
key_mapper('n', '<leader>s', ':SymbolsOutline<CR>')

-- <C-_> is <C-/>
key_mapper('n', '<C-_>', '<Plug>kommentary_line_default', {})
key_mapper('v', '<C-_>', '<Plug>kommentary_visual_default<ESC>', {})
key_mapper('n', '<C-/>', '<Plug>kommentary_line_default', {})
key_mapper('v', '<C-/>', '<Plug>kommentary_visual_default<ESC>', {})

-- easymotion settings
key_mapper('n', 'm', ':HopWord<CR>')


-- file tree keymap
-- nvim-keymap setting
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
key_mapper('n', 'ga', ':Lspsaga code_action<CR>')
key_mapper('n', 'ge', ':Lspsaga show_line_diagnostics<CR>')
key_mapper('n', 'gh', ':Lspsaga hover_doc<CR>')
-- key_mapper('n', 'gs', ':Lspsaga signature_help<CR>')
key_mapper('n', 'gr', ':Lspsaga rename<CR>')
-- key_mapper('n', 'gd', ':Lspsaga peek_definition<CR>')

-- floating terminal open and close
--[[ key_mapper('n', 'ss', ':Lspsaga open_floaterm<CR>', {silent=true})
key_mapper('t', 'ss', '<C-\\><C-n>:Lspsaga close_floaterm<CR>:wincmd p<CR>') ]]
-- key_mapper('t', '<ESC>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>:wincmd l<CR>')

-- bottom terminal
-- key_mapper('n', 'ss', ':NvimTreeToggle<CR>:ToggleTerm size=8 direction=horizontal<CR><C-\\><C-n>:NvimTreeToggle<CR>:wincmd p<CR>')
key_mapper('n', 'ss', ':ToggleTerm size=8 direction=horizontal<CR>')
key_mapper('t', 'ss', '<C-\\><C-n>:ToggleTerm size=8 direction=horizontal<CR>')
key_mapper('t', '<esc>', '<C-\\><C-n>')
-- dap debug
key_mapper('n', '<F1>', ':lua require"dap".toggle_breakpoint()<CR>')
key_mapper('n', '<F2>', ':lua require"dap".continue()<CR>')
key_mapper('n', '<F3>', ':lua require"dap".step_into()<CR>')
key_mapper('n', '<F4>', ':lua require"dap".step_over()<CR>')
key_mapper('n', '<leader>d', ':lua require"dapui".toggle()<CR>')
-- key_mapper('n', '<F5>', 'lua require"dap".toggle_breakpoint()<CR>')

key_mapper('i', '<C-Down>', '<C-O><C-E>')
key_mapper('i', '<C-Up>', '<C-O><C-Y>')
key_mapper('i', '<C-BS>', '<C-W>')
-- key_mapper('i', '<C-H>', '<C-W>')
--
vim.api.nvim_create_user_command(
    "Typora",
    typora,
    { desc = "start typora" }
)
