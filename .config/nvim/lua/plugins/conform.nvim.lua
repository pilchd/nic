return {
    "stevearc/conform.nvim",

    init = function ()
        vim.keymap.set({'n', 'v'}, "<C-f>", "<cmd>Conform<CR>")
    end,
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
    }
}
