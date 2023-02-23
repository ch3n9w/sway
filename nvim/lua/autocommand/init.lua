local vim = vim

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
    command = 'silent! mkview'
})

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
    command = 'silent! loadview'
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufCreate', 'BufEnter', 'BufLeave' }, {
    command = 'silent !fcitx5-remote -c'
})

vim.g.after_dashboard = 0
vim.g.width_open_tree = 100

vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    callback = function()
        -- only launch after dashboard.nvim once
        if vim.g.after_dashboard == 1 then
            return
        end
        vim.g.after_dashboard = 1
        -- if there is no nvim-tree, just exit
        if package.loaded['nvim-tree'] == nil then
            return
        end
        local open_tree_without_focus = function()
            require('nvim-tree.api').tree.toggle(false, true)
        end
        -- decide whether to open nvim-tree according to the window size
        if vim.api.nvim_list_uis()[1].width > vim.g.width_open_tree then
            -- call open_tree_without_focus directly
            -- will cause `vim xxx` unable to keep focus on buffer
            vim.fn.timer_start(1, open_tree_without_focus)
        else
            return
        end
    end
})

vim.api.nvim_create_autocmd({ 'VimResized' }, {
    callback = function()
        -- will not take effect before dashboard end
        if vim.g.after_dashboard == 0 then
            return
        end
        -- if there is no nvim-tree, just exit
        if package.loaded['nvim-tree'] == nil then
            return
        end
        local nvim_tree_view = require('nvim-tree.view')
        -- decide whether to open nvim-tree according to the window size
        vim.pretty_print(vim.fn.winwidth(0))
        if vim.api.nvim_list_uis()[1].width > vim.g.width_open_tree then
            if #vim.api.nvim_list_wins() > 1 then
                return
            end
            -- if vim.fn.winwidth(0) > vim.g.width_open_tree then
            if nvim_tree_view.is_visible() then
                return
            else
                require('nvim-tree.api').tree.toggle(false, true)
            end
        else
            if nvim_tree_view.is_visible() then
                require('nvim-tree.api').tree.close()
            end
        end
    end
})

-- vim.cmd("autocmd VimResized * if winwidth(0) > 100 | execute 'NvimTreeOpen' | execute 'NvimTreeFocus' | wincmd p | else | execute 'NvimTreeClose' | endif")

-- disable nvim-tree auto-close, as I always close whole window
-- if the last buffer is nvim-tree, then quit it
--"BufWinEnter"
-- vim.api.nvim_create_autocmd({""}, {
--     pattern = {""},
--     callback = function ()
--         -- get number of valid buffers
--         local is_valid = function(buf_num)
--             if not buf_num or buf_num < 1 then return false end
--             local exists = vim.api.nvim_buf_is_valid(buf_num)
--             return vim.bo[buf_num].buflisted and exists
--         end
--         local valid_buffer_number = #vim.tbl_filter(is_valid, vim.api.nvim_list_bufs())

--         if valid_buffer_number > 1 then
--             return
--         else
--             vim.cmd("quitall")
--         end
--     end
-- })
--[[ vim.api.nvim_create_autocmd("BufEnter", {
    nested = false,

    callback = function()
        -- get buffer number
        local bufnums = 0
        for buffer = 1, #vim.api.nvim_list_bufs() do
            if vim.fn.buflisted(buffer) == 1 then
                bufnums = bufnums + 1
            end
        end

        -- skip errors
        local _, _ = pcall(
        vim.cmd,
        "wa"
        )

        if #vim.api.nvim_list_wins() == 1 and bufnums == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"

        end
    end
}) ]]
