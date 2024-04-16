return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 999,
    opts = {
        transparent = true
    },
    config = function(lazyPlugin, opts)
        local onedark = require("onedark")
        onedark.setup(opts)
        onedark.load()

        vim.cmd("highlight FloatBorder guibg=NONE")
    end
}
