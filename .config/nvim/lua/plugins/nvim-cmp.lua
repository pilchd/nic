return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help"
    },

    config = function(lazyPlugin, opts)
        local cmp = require("cmp")

        cmp.setup {
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            sources = cmp.config.sources {
                {name = "nvim_lsp"},
                {name = "nvim_lsp_signature_help"}
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = {
                ["<C-Space>"] = cmp.mapping(function (fallback)
                    if not cmp.visible() then cmp.complete() else cmp.abort() end
                end, {'i', 's'}),
                ["<Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then cmp.confirm({select = true}) else fallback() end
                end, {'i', 's'}),
                ["<S-Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then cmp.select_next_item() else fallback() end
                end, {'i', 's'}),
                ["<C-S-Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then cmp.select_prev_item() else fallback() end
                end, {'i', 's'}),
                ["<M-S-Tab>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then cmp.select_prev_item() else fallback() end
                end, {'i', 's'}),
                ["<C-j>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then cmp.scroll_docs(1) else fallback() end
                end, {'i', 's'}),
                ["<C-k>"] = cmp.mapping(function (fallback)
                    if cmp.visible() then cmp.scroll_docs(-1) else fallback() end
                end, {'i', 's'})
            },

        }
    end
}
