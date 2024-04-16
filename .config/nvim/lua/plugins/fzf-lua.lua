return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local actions = require("fzf-lua").actions

        require("fzf-lua").setup {
            "fzf-native",

            --previewers = {
            --    bat = {
            --        args = "--color=always --style=numbers,changes --line-range :99"
            --    }
            --},
            keymap = {
                fzf = {
                    ["alt-j"] = "preview-down",
                    ["alt-k"] = "preview-up"
                }
            },

            files = {
                actions = {
                    ["ctrl-g"] = false,
                    ["ctrl-i"] = {actions.toggle_ignore}
                }
            }
        }
    end
}
