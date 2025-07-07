return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    build = ":TSUpdate",

    opts = {
        ensure_installed = {
            "bash",
            "c", "cpp",
            "css",
            "gitcommit",
            "go",
            "hcl",
            "html",
            "javascript",
            "jq",
            "jsdoc",
            "json",
            "latex",
            "lua",
            "markdown", "markdown_inline",
            "rust",
            "typescript",
            "yaml"
        },

        highlight = {
            enable = true
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,

                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["as"] = "@scope"
                }
            },
            swap = {
                enable = true,

                swap_next = {
                    ["<leader>r"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>e"] = "@parameter.inner",
                }
            },
            move = {
                enable = true,
                set_jumps = true,

                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                    ["]s"] = "@scope",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                    ["]S"] = "@scope",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                    ["[s"] = "@scope",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                    ["[S"] = "@scope",
                },
            }
        }
    },
    config = function (lazyPlugin, opts)
        require("nvim-treesitter.configs").setup(opts)
        local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

        vim.keymap.set({'n', 'x', 'o'}, ';', ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({'n', 'x', 'o'}, ',', ts_repeat_move.repeat_last_move_previous)
        vim.keymap.set({'n', 'x', 'o'}, 'f', ts_repeat_move.builtin_f_expr, {expr = true})
        vim.keymap.set({'n', 'x', 'o'}, 'F', ts_repeat_move.builtin_F_expr, {expr = true})
        vim.keymap.set({'n', 'x', 'o'}, 't', ts_repeat_move.builtin_t_expr, {expr = true})
        vim.keymap.set({'n', 'x', 'o'}, 'T', ts_repeat_move.builtin_T_expr, {expr = true})
    end
}
