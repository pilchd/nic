return {
    "stevearc/conform.nvim",

    opts = {
        formatters_by_ft = {
            css = {"prettier"},
            html = {"prettier"},
            javascript = {"prettier"},
            javascriptreact = {"prettier"},
            typescript = {"prettier"},
            typescriptreact = {"prettier"},
            yaml = {"prettier"}
        }
    },
    lazy = false, keys = {
        { mode = {"n", "v"}, "<C-f>", function () require("conform").format() end }
    }
}
