return {
    "navarasu/onedark.nvim",
    dependencies = {
     "neovim/nvim-lspconfig",
    },
    priority = 1000,

    opts = {
        transparent = true,
        code_style = {
            functions = "bold"
        },
        highlights = {
            ["Pmenu"] = {fg = "$grey", bg = "NONE"},
            ["NormalFloat"] = {fg = "fg", bg = "NONE"},
            ["FloatBorder"] = {bg = "NONE"},

            ["@punctuation.bracket"] = {fg = "$dark_yellow"},

            ["BlinkCmpMenuSelection"] = {fg = "$red", fmt="bold"},
            ["BlinkCmpDocBorder"] = {fg = "$grey", bg = "NONE"},
            ["BlinkCmpSignatureHelpBorder"] = {fg = "$grey", bg = "NONE"}
        }
    },
    config = function(lazyPlugin, opts)
        local onedark = require("onedark")
        onedark.setup(opts)
        onedark.load()
    end
}
