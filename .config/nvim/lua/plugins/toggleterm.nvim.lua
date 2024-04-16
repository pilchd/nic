return {
    "akinsho/toggleterm.nvim", version = "*",
    opts = {
        size = 80,
        open_mapping = "<C-\\>",
        on_open = function(t)
            vim.cmd("startinsert!")
            --vim.api.nvim_buf_set_keymap(t.bufnr, 't', "<Esc>", "<cmd>
        end,
        shade_terminals = false,
        persist_size = false,
        direction = "vertical",
        close_on_exit = true,
        float_opts = {
            border = "curved",
            title_pos = "right"
        }
    },
    config = function(LazyPlugin, opts)
        require("toggleterm").setup(opts)
        local Terminal = require("toggleterm.terminal").Terminal

        local nnn = Terminal:new({
            count = 0,
            cmd = "nnn",
            display_name = string.format("  nnn: %s  ", vim.fn.expand("%:~:h")),
            direction = "float",
            dir = vim.fn.expand("%:h"),
            close_on_exit = true,
            env = {
                PILCHD_NOMOTD = 1
            },
            on_open = function(t)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(t.bufnr, 't', "<Esc>", "<cmd>0ToggleTerm<CR>", {noremap = true, silent = true})
            end
        })
        function nnn_toggle()
            nnn:toggle()
        end
        vim.api.nvim_set_keymap('n', "<leader>e", ":lua nnn_toggle()<CR>", {noremap = true, silent = true})

        local lazygit = Terminal:new({
            count = 9,
            cmd = "lazygit",
            display_name = string.format("  lazygit: %s  ", vim.fn.fnamemodify(vim.loop.cwd(), ":~")),
            direction = "float",
            close_on_exit = true,
            on_open = function(t)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(t.bufnr, 't', "<Esc>", "<cmd>9ToggleTerm<CR>", {noremap = true, silent = true})
            end
        })
        function lazygit_toggle()
            lazygit:toggle()
        end
        vim.api.nvim_set_keymap('n', "<leader>v", ":lua lazygit_toggle()<CR>", {noremap = true, silent = true})

        local nic = Terminal:new({
            count = 1,
            display_name = string.format("  bash: %s  ", vim.fn.expand("%:~:h")),
            direction = "float",
            dir = vim.fn.expand("%:h"),
            close_on_exit = true,
            env = {
                PILCHD_TAG = "nic"
            },
            on_open = function(t)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(t.bufnr, 't', "<Esc>", "<cmd>1ToggleTerm<CR>", {noremap = true, silent = true})
            end
        })
        function nic_toggle()
            nic:toggle()
        end
        vim.api.nvim_set_keymap('n', "<leader>n", ":lua nic_toggle()<CR>", {noremap = true, silent = true})

    end
}
