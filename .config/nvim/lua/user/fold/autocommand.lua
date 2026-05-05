local group = vim.api.nvim_create_augroup("pilchd_fold", { clear = true })

vim.api.nvim_create_autocmd("OptionSet", {
  group = group,
  pattern = "foldenable",
  callback = function()
    if vim.v.option_new == true then
      vim.opt_local.foldcolumn = "auto:1"
    else
      vim.opt_local.foldcolumn = "0"
    end
  end,
})

