vim.api.nvim_create_autocmd("LspAttach", {
    callback = function ()
        local opts = { silent = true }

        vim.keymap.set('n', "<Leader>d", vim.diagnostic.open_float,   opts)
        vim.keymap.set('n', "gCi",       vim.lsp.buf.incoming_calls,  opts)
        vim.keymap.set('n', "gCo",       vim.lsp.buf.outgoing_calls,  opts)
        vim.keymap.set('n', "gd",        vim.lsp.buf.definition,      opts)
        vim.keymap.set('n', "gD",        vim.lsp.buf.declaration,     opts)
        vim.keymap.set('n', "gh",        vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', "gi",        vim.lsp.buf.implementation,  opts)
        vim.keymap.set('n', "gr",        vim.lsp.buf.references,      opts)
        vim.keymap.set('n', "<F1>",      vim.lsp.buf.signature_help,  opts)
        vim.keymap.set('n', "<F2>",      vim.lsp.buf.rename,          opts)
        vim.keymap.set('n', "<C-.>",     vim.lsp.buf.code_action,     opts)
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
        local win = vim.api.nvim_get_current_win()

        if not client:supports_method("textDocument/foldingRange") then
            return
        end

        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "v:lua.vim.lsp.foldexpr()"
    end,
})
