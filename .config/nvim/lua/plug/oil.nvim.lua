return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    init = function ()
        vim.keymap.set('n', "<C-c>", "<cmd>Oil<CR>")
        vim.keymap.set('i', "<C-c>", "<ESC><cmd>Oil<CR>")

        vim.api.nvim_create_augroup("oil.nvim", {clear = true})
        vim.api.nvim_create_autocmd({"FileType"}, {
            group = "oil.nvim",
            pattern = "oil",
            callback = function ()
                vim.keymap.set('n', "<C-s>", [[<cmd>lua require("oil").save({confirm = nil})<CR>]], {buffer = true})
                vim.keymap.set('i', "<C-s>", [[<esc><cmd>lua require("oil").save({confirm = nil})<CR>]], {buffer = true})
            end
        })
    end,
    opts = {
        columns = {"mtime", "icon"},
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
          ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
          ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["<esc>"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = false,
        view_options = {
            show_hidden = true,
            is_always_hidden = function (name, bufnr)
                for _, check in ipairs({".", "..", ".git"}) do
                    if name == check then return true end
                end
                return false
            end
        }
    }
}
