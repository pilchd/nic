vim.lsp.enable({
    "lua_ls", "vtsls"
})

vim.lsp.config("lua_ls", {
    init_options = {
        provideFormatter = false
    },

    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths
                    -- here.
                    -- '${3rd}/luv/library'
                    -- '${3rd}/busted/library'
                }
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
            }
        })
    end,
    settings = {
        Lua = { }
    }
})
vim.lsp.config("vtsls", {
    settings = {
        javascript = {
            format = {
                enabled = "never"
            }
        },
        typescript = {
            format = {
                enabled = "never"
            },
            updateImportsOnFileMove = {
                enabled = "never"
            }
        }
    }
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function ()
        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,   opts)
        vim.keymap.set("n", "gCi",       vim.lsp.buf.incoming_calls,  opts)
        vim.keymap.set("n", "gCo",       vim.lsp.buf.outgoing_calls,  opts)
        vim.keymap.set("n", "gd",        vim.lsp.buf.definition,      opts)
        vim.keymap.set("n", "gD",        vim.lsp.buf.declaration,     opts)
        vim.keymap.set("n", "gh",        vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi",        vim.lsp.buf.implementation,  opts)
        vim.keymap.set("n", "gr",        vim.lsp.buf.references,      opts)
        vim.keymap.set("n", "<F1>",      vim.lsp.buf.signature_help,  opts)
        vim.keymap.set("n", "<F2>",      vim.lsp.buf.rename,          opts)
        vim.keymap.set("n", "<C-.>",     vim.lsp.buf.code_action,     opts)
    end
})
