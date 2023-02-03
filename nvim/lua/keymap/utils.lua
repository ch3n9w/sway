local vim = vim

M = {}

M.DeleteWinOrBuf = function ()
    local cmd1 = 'write'
    local cmd2 = 'Bdelete'
    -- if current buf is NvimTree
    if vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
        cmd1 = ''
        cmd2 = 'quit'
    elseif vim.fn.win_gettype(0):match("quickfix") ~= nil then
        cmd1 = ''
        cmd2 = 'quit'
    elseif vim.api.nvim_buf_get_name(0) == "" then
        cmd1 = ''
        cmd2 = 'Bdelete'
    elseif #vim.api.nvim_list_wins() == 2 then
        -- check if there is NvimTree open
        cmd2 = 'quit'
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("NvimTree_") ~= nil then
                cmd2 = 'Bdelete'
                break
            end
        end
    elseif #vim.api.nvim_list_wins() > 2 then
        cmd2 = 'quit'
    end
    vim.cmd(cmd1)
    vim.cmd(cmd2)
end

M.ReferenceToggle = function ()
    local wins = vim.fn.getwininfo()
    local quickfix
    -- if there is quickfix window, close it
    for _, win in ipairs(wins) do
        if win.quickfix == 1 then
            quickfix = win.winid
            vim.api.nvim_win_close(quickfix, 1)
            return
        end
    end
    -- if there is no quickfix, open it
    vim.lsp.buf.references()
    vim.cmd('wincmd p')
end

-- as clangd do not support formatting
M.FormatCode = function ()
    if vim.bo.filetype == "norg" then
        vim.cmd('execute \"normal gg=G\\<C-o>\"')
    else
        vim.lsp.buf.format()
    end
end

M.Typora = function ()
    local filename = vim.api.nvim_buf_get_name(0)
    vim.fn.system("Typora " .. filename)
end

return M



-- function quit_behavior()
-- vim.api.nvim_buf_get_name(xx) DAP
-- Bdelete will not remove buffer from list
-- but nvim_buf_is_loaded will be false
-- echo nvim_list_bufs contains nvim-tree, DAP
--
-- bufleave --> if there is only
-- 1. Nvimtree
-- 2. DAP
-- 3. No Name
-- then quit
-- for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
--
-- end

-- if #vim.api.nvim_list_wins() > 1 then
--     vim.cmd('write')
--     vim.cmd('q')
-- else
--     vim.cmd('write')
--     vim.cmd('Bdelete')
-- end
-- end
-- custom function to quit win or buffer
