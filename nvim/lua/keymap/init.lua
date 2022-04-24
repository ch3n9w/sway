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

key_mapper('n', ')', '$')
key_mapper('v', ')', '$')
key_mapper('n', '(', '^')
key_mapper('v', '(', '^')
key_mapper('n', 'Q', 'q')
key_mapper('v', 'Q', 'q')
key_mapper('n', 'q', '<ESC>:wq<CR>')
key_mapper('v', 'q', '<ESC>:wq<CR>')
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
key_mapper('n', '<C-j>', '<PageDown>')
key_mapper('n', '<C-k>', '<PageUp>')
key_mapper('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
key_mapper('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})


key_mapper('i', '<C-l>', '<ESC>$a')
key_mapper('i', '<C-h>', '<ESC>^i')
key_mapper('i', '<C-j>', '<ESC>o')
key_mapper('i', '<C-k>', '<ESC>O')


key_mapper('n', 'H', ':Lspsaga hover_doc<CR>')
key_mapper('n', 'gs', ':Lspsaga signature_help<CR>')
key_mapper('n', 'gr', ':Lspsaga rename<CR>')
key_mapper('n', 'gd', ':Lspsaga preview_definition<CR>')

-- floating terminal open and close
key_mapper('n', 'ss', ':Lspsaga open_floaterm<CR>')
key_mapper('t', 'ss', '<C-\\><C-n>:Lspsaga close_floaterm<CR>:wincmd l<CR>')
key_mapper('t', '<ESC>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>:wincmd l<CR>')

key_mapper('n', '<C-s>', ':SymbolsOutline<CR>')

-- telescope file fuzzy finder
-- keymapper settings
-- sw: search word under cursor
-- sf: search file
-- if i want to search word by my typing, just move the cursor to a empty place and type sw
key_mapper('n','sw', ':Telescope grep_string<CR>')
key_mapper('n','sf', ':Telescope find_files<CR>')


-- nvim-tree settings
key_mapper('n', '<leader>t', ':NvimTreeToggle<CR>')

-- <C-_> is <C-/>
key_mapper('n', '<C-_>', '<Plug>kommentary_line_default', {})
key_mapper('v', '<C-_>', '<Plug>kommentary_visual_default<ESC>', {})

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
-- key_mapper('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>')
