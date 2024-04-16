local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = {
            {"╭", "FloatBorder"},
            {"─", "FloatBorder"},
            {"╮", "FloatBorder"},
            {"│", "FloatBorder"},
            {"╯", "FloatBorder"},
            {"─", "FloatBorder"},
            {"╰", "FloatBorder"},
            {"│", "FloatBorder"}
        }
    })
}

return {
    {
        "neovim/nvim-lspconfig",

        config = function(lazyPlugin, opts)
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            lspconfig.cssls.setup {
                capabilities = capabilities,
                handlers = handlers,
                init_options = {
                    provideFormatter = false
                }
            }

            lspconfig.html.setup {
                capabilities = capabilities,
                handlers = handlers,
                init_options = {
                    provideFormatter = false
                }
            }

            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                handlers = handlers
            }

            lspconfig.yamlls.setup {
                capabilities = capabilities,
                handlers = handlers,
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"]
                                = "./github/workflows/*"
                        }
                    }
                }
            }
        end
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim"
        },

        opts = {
            handlers = handlers
        }
    }
}
