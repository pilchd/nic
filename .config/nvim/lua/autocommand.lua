vim.api.nvim_create_augroup("pilchd", {clear=true})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = "pilchd",
    pattern = "*",
    command = "setlocal formatoptions-=o"
})
--vim.api.nvim_create_autocmd({"BufEnter"}, {
--    group = "pilchd",
--    pattern = "term://*",
--    command = "startinsert"
--})
