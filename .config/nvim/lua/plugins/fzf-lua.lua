return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    init = function()
        vim.keymap.set('n', "<leader><leader>", "<cmd>FzfLua tabs<CR>")
        vim.keymap.set('n', "<leader>j", "<cmd>FzfLua buffers<CR>")
        vim.keymap.set('n', "<leader>p", "<cmd>FzfLua files<CR>")

        vim.keymap.set('n', "<leader>c", "<cmd>FzfLua quickfix<CR>")
        vim.keymap.set('n', "<leader>l", "<cmd>FzfLua loclist<CR>")

        vim.keymap.set('n', "<leader>gCi", "<cmd>FzfLua lsp_incoming_calls<CR>")
        vim.keymap.set('n', "<leader>gCo", "<cmd>FzfLua lsp_outgoing_calls<CR>")
        vim.keymap.set('n', "<leader>gd", "<cmd>FzfLua lsp_definitions<CR>")
        vim.keymap.set('n', "<leader>gD", "<cmd>FzfLua lsp_declarations<CR>")
        vim.keymap.set('n', "<leader>gh", "<cmd>FzfLua lsp_typedefs<CR>")
        vim.keymap.set('n', "<leader>gi", "<cmd>FzfLua lsp_implementations<CR>")
        vim.keymap.set('n', "<leader>gr", "<cmd>FzfLua lsp_references<CR>")
        vim.keymap.set('n', "<leader>gs", "<cmd>FzfLua lsp_document_symbols<CR>")
        vim.keymap.set('n', "<leader>gS", "<cmd>FzfLua lsp_workspace_symbols<CR>")
        vim.keymap.set('n', "<leader><C-.>", "<cmd>FzfLua lsp_code_actions<CR>")

        vim.keymap.set('n', "<leader>h", "<cmd>FzfLua diagnostics_document<CR>")
        vim.keymap.set('n', "<leader>H", "<cmd>FzfLua diagnostics_workspace<CR>")

        vim.keymap.set('n', "<leader>f", "<cmd>FzfLua grep_project<CR>")
        vim.keymap.set('n', "<leader>F", "<cmd>FzfLua grep_curbuf<CR>")

        vim.keymap.set('n', "<leader>sb", "<cmd>FzfLua git_branches<CR>")
        vim.keymap.set('n', "<leader>sc", "<cmd>FzfLua git_commits<CR>")
        vim.keymap.set('n', "<leader>sh", "<cmd>FzfLua git_stash<CR>")
        vim.keymap.set('n', "<leader>ss", "<cmd>FzfLua git_status<CR>")
        vim.keymap.set('n', "<leader>st", "<cmd>FzfLua git_tags<CR>")

        vim.keymap.set('t', "<S-CR>", "<C-\\><C-n><cmd>FzfLua tabs<CR>")
    end,
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
