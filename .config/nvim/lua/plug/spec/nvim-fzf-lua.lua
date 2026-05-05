return {
    "https://github.com/ibhagwan/fzf-lua",

    opts = function (module)
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
                        module.actions.file_edit(...)
                        if vim.bo.buftype == "terminal" then
                            vim.api.nvim_feedkeys('i', 'n', true)
                        end
                    end
                }
            },
            tabs = {
                this = {
                    ["enter"] = function (...)
                        module.actions.file_switch(...)
                        if vim.bo.buftype == "terminal" then
                            vim.api.nvim_feedkeys('i', 'n', true)
                        end
                    end
                }
            },
            files = {
                actions = {
                    ["ctrl-g"] = false, ["ctrl-i"] = {module.actions.toggle_ignore}
                }
            }
        }
    end,
    keys = function (module)
        local cmd = function (cmd) return function () module[cmd]() end end

        return {
            {"n", "<Leader><Leader>", cmd("tabs")},
            {"n", "<Leader>j",        cmd("buffers")},
            {"n", "<Leader>p",        cmd("files")},

            {"n", "<Leader>c",        cmd("quickfix")},
            {"n", "<Leader>l",        cmd("loclist")},

            {"n", "<Leader>gCi",      cmd("lsp_incoming_calls")},
            {"n", "<Leader>gCo",      cmd("lsp_outgoing_calls")},
            {"n", "<Leader>gd",       cmd("lsp_definitions")},
            {"n", "<Leader>gD",       cmd("lsp_declarations")},
            {"n", "<Leader>gh",       cmd("lsp_typedefs")},
            {"n", "<Leader>gi",       cmd("lsp_implementations")},
            {"n", "<Leader>gr",       cmd("lsp_references")},
            {"n", "<Leader>gs",       cmd("lsp_document_symbols")},
            {"n", "<Leader>gS",       cmd("lsp_workspace_symbols")},
            {"n", "<Leader><C-.>",    cmd("lsp_code_actions")},

            {"n", "<Leader>h",        cmd("diagnostics_document")},
            {"n", "<Leader>H",        cmd("diagnostics_workspace")},

            {"n", "<Leader>f",        cmd("grep_project")},
            {"n", "<Leader>F",        cmd("grep_curbuf")},

            {"n", "<Leader>sb",       cmd("git_branches")},
            {"n", "<Leader>sc",       cmd("git_commits")},
            {"n", "<Leader>sh",       cmd("git_stash")},
            {"n", "<Leader>ss",       cmd("git_status")},
            {"n", "<Leader>st",       cmd("git_tags")}

            --{ mode = "t", "<S-CR>", "<C-\\><C-n><cmd>FzfLua tabs<CR>" }
        }
    end,
}
