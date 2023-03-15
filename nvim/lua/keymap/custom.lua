local vim = vim

M = {}

M.DeleteWinOrBuf = function()
    local pre_exit = ''
    local exit = 'quit'
    local current_bufnr = vim.api.nvim_win_get_buf(0)
    local current_buf_name = vim.api.nvim_buf_get_name(current_bufnr)
    local current_win_number = vim.api.nvim_get_current_win()
    local is_valid = function(bufnr)
        if not bufnr or bufnr < 1 then return false end
        local exists = vim.api.nvim_buf_is_valid(bufnr)
        return vim.bo[bufnr].buflisted and exists
    end
    -- the current buffer should be valid
    if is_valid(current_bufnr) then
        pre_exit = 'write'
        exit = 'Bdelete'
        local should_quit = 0
        -- check if there is other window contains valid buffer
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            local bufnr = vim.api.nvim_win_get_buf(win)
            -- bufnr ~= current_bufnr
            if win ~= current_win_number and is_valid(bufnr) then
                pre_exit = 'write'
                exit = 'quit'
                should_quit = 1
                break
            end
        end
        if should_quit == 0 then
            -- if there is only [No Name], quitall
            local valid_buffer_number = #vim.tbl_filter(is_valid, vim.api.nvim_list_bufs())
            vim.pretty_print(valid_buffer_number)
            vim.pretty_print(current_buf_name)
            if current_buf_name == "" and valid_buffer_number == 1 then
                pre_exit = ''
                exit = 'quitall'
            end
        end
    end
    -- dont block exit even failed to save
    pcall(vim.cmd, pre_exit)
    vim.cmd(exit)
end


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
--

-- M.DeleteWinOrBuf_bak = function()
--     local cmd1 = 'write'
--     local cmd2 = 'Bdelete'
--     local current_buffer_name = vim.api.nvim_buf_get_name(0)
--     -- close all popup window
--     for _, win in ipairs(vim.api.nvim_list_wins()) do
--         local config = vim.api.nvim_win_get_config(win);
--         if config.relative ~= "" then
--             vim.api.nvim_win_close(win, false);
--             -- print('Closing window', win)
--         end
--     end
--     -- if current buf is NvimTree
--     if current_buffer_name:match("NvimTree_") ~= nil then
--         vim.pretty_print('1')
--         cmd1 = ''
--         cmd2 = 'quit'
--     elseif current_buffer_name:match("nvim/runtime/doc") ~= nil then
--         vim.pretty_print('2')
--         cmd1 = ''
--         cmd2 = 'quit'
--     elseif vim.fn.win_gettype(0):match("quickfix") ~= nil then
--         vim.pretty_print('3')
--         cmd1 = ''
--         cmd2 = 'quit'
--         -- if the buffer is [No Name]
--     elseif current_buffer_name == "" then
--         vim.pretty_print('4')
--         -- get valid buffer number
--         local is_valid = function(buf_num)
--             if not buf_num or buf_num < 1 then return false end
--             local exists = vim.api.nvim_buf_is_valid(buf_num)
--             return vim.bo[buf_num].buflisted and exists
--         end
--         local valid_buffer_number = #vim.tbl_filter(is_valid, vim.api.nvim_list_bufs())
--         if valid_buffer_number > 1 then
--             -- if the [No Name] is not the last buffer, Bdelete it
--             cmd1 = ''
--             cmd2 = 'Bdelete'
--         else
--             -- if the [No Name] is the last buffer, quit
--             cmd1 = ''
--             cmd2 = 'quitall'
--         end
--     elseif #vim.api.nvim_list_wins() == 2 then
--         vim.pretty_print('4')
--         -- check if there is NvimTree open
--         cmd2 = 'quit'
--         for _, win in ipairs(vim.api.nvim_list_wins()) do
--             if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("NvimTree_") ~= nil then
--                 cmd2 = 'Bdelete'
--                 break
--             end
--         end
--     elseif #vim.api.nvim_list_wins() > 2 then
--         -- debug
--         for _, win in ipairs(vim.api.nvim_list_wins()) do
--             local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
--             vim.pretty_print(bufname)
--             vim.pretty_print(vim.fn.win_gettype(win))
--             vim.pretty_print(vim.api.nvim_win_get_config(win))
--         end
--         vim.pretty_print('5')
--         cmd2 = 'quit'
--     end
--     vim.pretty_print(cmd2)
--     vim.cmd(cmd1)
--     vim.cmd(cmd2)
-- end
