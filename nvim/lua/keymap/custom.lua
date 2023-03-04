local vim = vim

M = {}

M.DeleteWinOrBuf = function()
    local cmd1 = 'write'
    local cmd2 = 'Bdelete'
    local current_buffer_name = vim.api.nvim_buf_get_name(0)
    -- close all popup window
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win);
        if config.relative ~= "" then
            vim.api.nvim_win_close(win, false);
            -- print('Closing window', win)
        end
    end
    -- if current buf is NvimTree
    if current_buffer_name:match("NvimTree_") ~= nil then
        vim.pretty_print('1')
        cmd1 = ''
        cmd2 = 'quit'
    elseif current_buffer_name:match("nvim/runtime/doc") ~= nil then
        vim.pretty_print('2')
        cmd1 = ''
        cmd2 = 'quit'
    elseif vim.fn.win_gettype(0):match("quickfix") ~= nil then
        vim.pretty_print('3')
        cmd1 = ''
        cmd2 = 'quit'
        -- if the buffer is [No Name]
    elseif current_buffer_name == "" then
        vim.pretty_print('4')
        -- get valid buffer number
        local is_valid = function(buf_num)
            if not buf_num or buf_num < 1 then return false end
            local exists = vim.api.nvim_buf_is_valid(buf_num)
            return vim.bo[buf_num].buflisted and exists
        end
        local valid_buffer_number = #vim.tbl_filter(is_valid, vim.api.nvim_list_bufs())
        if valid_buffer_number > 1 then
            -- if the [No Name] is not the last buffer, Bdelete it
            cmd1 = ''
            cmd2 = 'Bdelete'
        else
            -- if the [No Name] is the last buffer, quit
            cmd1 = ''
            cmd2 = 'quitall'
        end
    elseif #vim.api.nvim_list_wins() == 2 then
        vim.pretty_print('4')
        -- check if there is NvimTree open
        cmd2 = 'quit'
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("NvimTree_") ~= nil then
                cmd2 = 'Bdelete'
                break
            end
        end
    elseif #vim.api.nvim_list_wins() > 2 then
        vim.pretty_print('5')
        cmd2 = 'quit'
    end
    vim.pretty_print(cmd2)
    vim.cmd(cmd1)
    vim.cmd(cmd2)
end

M.ReferenceToggle = function()
    -- -- local pre_win = vim.api.nvim_get_current_win()
    -- local wins = vim.fn.getwininfo()
    -- local quickfix
    -- -- if there is quickfix window, close it
    -- for _, win in ipairs(wins) do
    --     if win.quickfix == 1 then
    --         quickfix = win.winid
    --         vim.api.nvim_win_close(quickfix, 1)
    --         return
    --     end
    -- end
    -- if there is no quickfix, open it
    vim.lsp.buf.references()
    -- vim.api.nvim_set_current_win(pre_win)
end

-- as clangd do not support formatting
M.FormatCode = function()
    if vim.bo.filetype == "norg" then
        vim.cmd('execute \"normal gg=G\\<C-o>\"')
    else
        vim.lsp.buf.format()
    end
end

M.Typora = function()
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
