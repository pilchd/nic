return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    config = function ()
        local actions = require("fzf-lua").actions

        require("fzf-lua").setup {
            "fzf-native",

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
