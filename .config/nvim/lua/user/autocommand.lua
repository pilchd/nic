vim.api.nvim_create_augroup("pilchd", {clear = true})

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
    group = "pilchd", command = "checktime"
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = "pilchd",
    pattern = "javascript,javascriptreact,typescript,typescriptreact",
    callback = function()
        vim.opt_local.smartindent = true
        vim.opt_local.cindent = false
        vim.opt_local.indentexpr = nil
    end
})
vim.api.nvim_create_autocmd({"FileType"}, {
    group = "pilchd",
    pattern = "javascript,javascriptreact,typescript,typescriptreact",
    callback = function()
        vim.opt_local.comments:remove("://")
    end
})

--vim.api.nvim_create_autocmd({"BufEnter"}, {
--    group = "pilchd",
--    callback = function ()
--        if (vim.bo.filetype == "oil")
--            then vim.opt.laststatus = 0
--            else vim.opt.laststatus = 3
--        end
--    end
--})

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
