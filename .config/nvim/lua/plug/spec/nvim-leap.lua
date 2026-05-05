return {
    {
        src = "https://codeberg.org/andyg/leap.nvim",
        data = {
            module_name = "leap",
        },
    },

    keys = {
        {{'n', 'x', 'o'}, "s", '<Plug>(leap-forward)'},
        {{'n', 'x', 'o'}, "S", '<Plug>(leap-backward)'},

        {{'n', 'o'}, 'gs', '<Plug>(leap-remote)'},
        {{'n', 'o'}, 'gS', '<Plug>(leap-remote-linewise)'},
        {{'x', 'o'}, 'ar', '<Plug>(leap-remote-text-object)'},
        {{'x', 'o'}, 'ir', '<Plug>(leap-remote-inner-text-object)'},

        {'n', "gl", '<Plug>(leap-from-window)'},
    },
    init = function ()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'RemoteOperationDone',
            group = vim.api.nvim_create_augroup('LeapRemote', {}),
            callback = function (event)
                if vim.v.operator == 'y' and
                    (event.data.register == '"' or event.data.register == '+')
                then
                    vim.cmd("normal! p")
                end
            end,
        })
    end,
}
