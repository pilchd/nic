return {
    "stevearc/conform.nvim",

    opts = {
        formatters_by_ft = {
            css = {"prettier"},
            go = {"gofmt"},
            html = {"prettier"},
            javascript = {"prettier"},
            javascriptreact = {"prettier"},
            typescript = {"prettier"},
            typescriptreact = {"prettier"}
        }
    }
}
