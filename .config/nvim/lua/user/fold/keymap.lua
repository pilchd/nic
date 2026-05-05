vim.iter({"zn", "zN", "zi"}):each(function (key)
    vim.keymap.set('n', key, function ()
        vim.cmd "normal! zi"

        if vim.wo.foldenable then
            vim.opt_local.foldcolumn = "auto:1"
        else
            vim.opt_local.foldcolumn = "0"
        end
    end)
end)
