local group = vim.api.nvim_create_augroup("pilchd", { clear = true })

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
    group = g_pilchd, command = "checktime"
})

vim.api.nvim_create_autocmd({"TermOpen"}, {
    group = g_pilchd,
    pattern = "term://*",
    callback = function ()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end
})
vim.api.nvim_create_autocmd({"TermOpen", "BufEnter", "WinEnter", "TabEnter"}, {
    group = g_pilchd,
    pattern = "term://*",
    command = "startinsert"
})




