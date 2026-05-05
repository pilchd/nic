return {
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",

    keys = function (spec)
        local normal = {"n", "x", "o"}
        local op = {"x", "o"}

        local swap = require "nvim-treesitter-textobjects.swap"
        local repeatable_move = require "nvim-treesitter-textobjects.repeatable_move"

        return {
            {normal, "<M-M>", function () swap.swap_previous "@parameter.inner" end},
            {normal, "<M-S-,>", function () swap.swap_next "@parameter.inner" end},

            --{normal, ';', repeatable_move.repeat_last_move_next},
            --{normal, ',', repeatable_move.repeat_last_move_previous},

            --{normal, 'f', repeatable_move.builtin_f_expr, { expr = true }},
            --{normal, 'F', repeatable_move.builtin_F_expr, { expr = true }},
            --{normal, 't', repeatable_move.builtin_t_expr, { expr = true }},
            --{normal, 'T', repeatable_move.builtin_T_expr, { expr = true }},
        }
    end,
}
