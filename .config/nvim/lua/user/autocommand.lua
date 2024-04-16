vim.api.nvim_create_augroup("pilchd", {clear=true})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = "pilchd",
    pattern = "*",
    command = "setlocal formatoptions-=o"
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
    group = "pilchd",
    pattern = "*",
    callback = function()
        vim.diagnostic.config {float = {border = "rounded"}}

        vim.cmd("highlight NormalFloat guibg=NONE")
    end
})

vim.api.nvim_create_autocmd({"TermOpen"}, {
    group = "pilchd",
    pattern = "term://*",
    command = "set signcolumn=no nonumber norelativenumber"
})
vim.api.nvim_create_autocmd({"TermOpen", "BufEnter", "WinEnter", "TabEnter"}, {
    group = "pilchd",
    pattern = "term://*",
    command = "startinsert"
})

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
    group = "pilchd",
    pattern = "*",
    command = "checktime"
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = "pilchd",
    pattern = "oil",
    callback = function()
        vim.keymap.set('n', "<C-s>", [[<cmd>lua require("oil").save({confirm = nil})<CR>]], {buffer = true})
        vim.keymap.set('i', "<C-s>", [[<esc><cmd>lua require("oil").save({confirm = nil})<CR>]], {buffer = true})
    end
})
