vim.api.nvim_create_augroup("pilchd", {clear=true})

vim.api.nvim_create_autocmd({"BufEnter"}, {
    group = "pilchd",
    pattern = "*",
    callback = function()
        vim.diagnostic.config {float = {border = "rounded"}}

        vim.cmd("highlight NormalFloat guibg=NONE")
    end
})
vim.api.nvim_create_autocmd({"FileType"}, {
    group = "pilchd",
    pattern = "*",
    command = "setlocal formatoptions-=o"
})
