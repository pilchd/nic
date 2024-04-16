return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help"
    },

    config = function(lazyPlugin, opts)
        local cmp = require("cmp")

        cmp.setup {
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert {
                ["<C-h>"] = cmp.mapping.scroll_docs(-3),
                ["<C-l>"] = cmp.mapping.scroll_docs(3),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-Space>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping.confirm({select = true})
            },
            sources = cmp.config.sources {
                {name = "nvim_lsp"},
                {name = "nvim_lsp_signature_help"},
                {name = "luasnip"}
            }
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
    end
}
