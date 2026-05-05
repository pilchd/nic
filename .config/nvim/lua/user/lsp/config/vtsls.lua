vim.lsp.config("vtsls", {
    settings = {
        javascript = {
            format = {
                enabled = "never",
            },
        },
        typescript = {
            format = {
                enabled = "never",
            },
            updateImportsOnFileMove = {
                enabled = "never",
            },
            suggest = {
                completeFunctionCalls = true,
            },
        },
    },
})
