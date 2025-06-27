return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    opts = function ()
        local fzf = require("fzf-lua")

        return {
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
                        fzf.actions.file_edit(...)
                        if vim.bo.buftype == "terminal" then
                            vim.api.nvim_feedkeys('i', 'n', true)
                        end
                    end
                }
            },
            tabs = {
                this = {
                    ["enter"] = function (...)
                        fzf.actions.file_switch(...)
                        if vim.bo.buftype == "terminal" then
                            vim.api.nvim_feedkeys('i', 'n', true)
                        end
                    end
                }
            },
            files = {
                actions = {
                    ["ctrl-g"] = false, ["ctrl-i"] = {fzf.actions.toggle_ignore}
                }
            }
        }
    end,
    lazy = false, keys = function ()
        local fzf = require("fzf-lua")
        local cmd = function(cmd) return function() fzf[cmd]() end end

        return {
            { "<leader><leader>", cmd("tabs") },
            { "<leader>j",        cmd("buffers") },
            { "<leader>p",        cmd("files") },

            { "<leader>c",        cmd("quickfix") },
            { "<leader>l",        cmd("loclist") },

            { "<leader>gCi",      cmd("lsp_incoming_calls") },
            { "<leader>gCo",      cmd("lsp_outgoing_calls") },
            { "<leader>gd",       cmd("lsp_definitions") },
            { "<leader>gD",       cmd("lsp_declarations") },
            { "<leader>gh",       cmd("lsp_typedefs") },
            { "<leader>gi",       cmd("lsp_implementations") },
            { "<leader>gr",       cmd("lsp_references") },
            { "<leader>gs",       cmd("lsp_document_symbols") },
            { "<leader>gS",       cmd("lsp_workspace_symbols") },
            { "<leader><C-.>",    cmd("lsp_code_actions") },

            { "<leader>h",        cmd("diagnostics_document") },
            { "<leader>H",        cmd("diagnostics_workspace") },

            { "<leader>f",        cmd("grep_project") },
            { "<leader>F",        cmd("grep_curbuf") },

            { "<leader>sb",       cmd("git_branches") },
            { "<leader>sc",       cmd("git_commits") },
            { "<leader>sh",       cmd("git_stash") },
            { "<leader>ss",       cmd("git_status") },
            { "<leader>st",       cmd("git_tags") },

            --{ mode = "t", "<S-CR>", "<C-\\><C-n><cmd>FzfLua tabs<CR>" }
        }
    end
}
