local group = vim.api.nvim_create_augroup("pilchd_kitty", { clear = true })

local function nvim_ui_send (data)
    if vim.api.nvim_ui_send then
        vim.api.nvim_ui_send(data)
    else
        io.stdout:write(data)
    end
end

vim.api.nvim_create_autocmd({"VimEnter", "VimResume", "UIEnter"}, {
    group = group,
    callback = function ()
        nvim_ui_send("\x1b]1337;SetUserVar=editor=MQo\007")
    end
})
vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {
    group = group,
    callback = function ()
        nvim_ui_send("\x1b]1337;SetUserVar=editor\007")
    end
})
