return {
    {
        src = "https://github.com/navarasu/onedark.nvim",
        data = {
            module_name = "onedark",
        },
    },

    opts = {
        transparent = true,
        code_style = {
            functions = "bold",
        },
        highlights = {
            ["Pmenu"] = { fg = "$grey", bg = "NONE" },
            ["NormalFloat"] = { fg = "fg", bg = "NONE" },
            ["FloatBorder"] = { bg = "NONE" },

            ["@punctuation.bracket"] = { fg = "$dark_yellow" },

            ["BlinkCmpMenuSelection"] = { fg = "$red", fmt="bold" },
            ["BlinkCmpDocBorder"] = { fg = "$grey", bg = "NONE" },
            ["BlinkCmpSignatureHelpBorder"] = { fg = "$grey", bg = "NONE" },
        },
    },
    init = function (module)
        module.load()
    end,
}
