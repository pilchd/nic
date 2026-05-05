local group = vim.api.nvim_create_augroup("pilchd_ft", { clear = true })

local ft_ecma = "javascript,javascriptreact,typescript,typescriptreact"

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = ft_ecma,
    callback = function()
        vim.opt_local.smartindent = true
        vim.opt_local.cindent = false
        vim.opt_local.indentexpr = nil
        vim.opt_local.shiftwidth = 2

        vim.opt_local.comments:remove("://")
    end
})
