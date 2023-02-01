M = function ()
    require("symbols-outline").setup({
        highlight_hovered_item = true,
        auto_close = false,
        keymaps = {
            close = {"<Esc>", "q"},
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            toggle_preview = "K",
            rename_symbol = "r",
            code_actions = "a",
            fold = "h",
            unfold = "l",
            fold_all = "W",
            unfold_all = "E",
            fold_reset = "R",
        }
    }
    )
end
return M
