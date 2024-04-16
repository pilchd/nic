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
            buffers = {
                actions = {
                    ["enter"] = function (...)
                        actions.file_edit(...)
                        if vim.bo.buftype == "terminal" then
                            vim.api.nvim_feedkeys('i', 'n', true)
                        end
                    end
                }
            },
            tabs = {
                actions = {
                    ["enter"] = function (...)
                        actions.file_switch(...)
                        if vim.bo.buftype == "terminal" then
                            vim.api.nvim_feedkeys('i', 'n', true)
                        end
                    end
                }
            },
            files = {
                actions = {
                    ["ctrl-g"] = false, ["ctrl-i"] = {actions.toggle_ignore}
                }
            }
        }
    end
}
