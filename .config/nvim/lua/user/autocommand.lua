vim.api.nvim_create_augroup("pilchd", {clear = true})

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
    group = "pilchd",
    pattern = "*",
    command = "checktime"
})
vim.api.nvim_create_autocmd({"FileType"}, {
    group = "pilchd",
    pattern = "*",
    command = "setlocal formatoptions-=o"
})
vim.api.nvim_create_autocmd({"FileType"}, {
    group = "pilchd",
    desc = "smartindent JS(X), TS(X)",
    pattern = "javascript,javascriptreact,typescript,typescriptreact",
    callback = function()
        vim.opt_local.autoindent = true
        vim.opt_local.smartindent = true
        vim.opt_local.cindent = false
        vim.opt_local.indentexpr = ""
    end
})

vim.api.nvim_create_autocmd({"TermOpen"}, {
    group = "pilchd",
    pattern = "term://*",
    callback = function ()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end
})
vim.api.nvim_create_autocmd({"TermOpen", "BufEnter", "WinEnter", "TabEnter"}, {
    group = "pilchd",
    pattern = "term://*",
    command = "startinsert"
})
