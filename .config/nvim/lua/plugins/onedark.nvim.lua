return {
    "navarasu/onedark.nvim",
    dependencies = {
     "neovim/nvim-lspconfig",
    },

    opts = {
        transparent = true,
        code_style = {
            functions = "bold"
        },
        highlights = {
            ["@punctuation.bracket"] = {fg = "$dark_yellow"},
            ["NormalFloat"] = {bg = "NONE"},
            ["FloatBorder"] = {bg = "NONE"}
        }
    },
    config = function(lazyPlugin, opts)
        local onedark = require("onedark")
        onedark.setup(opts)
        onedark.load()
    end
}
