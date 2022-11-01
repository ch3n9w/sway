M = {}
M.load = function ()
    local dap, dapui = require("dap"), require("dapui")
    require("dapui").setup({
        layouts = {
            {
                elements = {
                    { id = "scopes", size = 0.1 },
                },
                size = 7,
                position = "bottom",
            },
        }
    })
    require("dap-go").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
        vim.cmd("NvimTreeClose")
        dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
    end
end
return M
