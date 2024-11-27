return {
    {
        "echasnovski/mini.move",
        version = "*",

        opts = {
            mappings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",

                line_left = "<C-h>",
                line_down = "<C-j>",
                line_up = "<C-k>",
                line_right = "<C-l>"
            },
            options = {
                reindent_linewise = false
            }
        }
    },
    {
        "echasnovski/mini.trailspace",
        version = "*",

        init = function ()
            vim.keymap.set('n', "<leader>t<Space>", "<cmd>lua MiniTrailspace.trim()<CR>")
            vim.keymap.set('n', "<leader>t<CR>", "<cmd>lua MiniTrailspace.trim_last_lines()<CR>")
        end,
        config = true
    }
}
