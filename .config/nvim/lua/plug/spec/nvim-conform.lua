return {
    {
        src = "https://github.com/stevearc/conform.nvim",
        data = {
            module_name = "conform",
        },
    },

    opts = {
        formatters_by_ft = {
            css = {"prettier"},
            html = {"prettier"},
            javascript = {"prettier"},
            javascriptreact = {"prettier"},
            json = {"prettier"},
            jsonc = {"prettier"},
            typescript = {"prettier"},
            typescriptreact = {"prettier"},
            yaml = {"prettier"}
        },
    },
    keys = function (module)
        return {
            {{"n", "v"}, "<C-f>", function () module.format() end},
        }
    end,
    init = function (module)
        -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#format-command
        vim.api.nvim_create_user_command("Conform", function (args)
            local range
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    ["start"] = {args.line1, 0},
                    ["end"] = {args.line2, end_line:len()},
                }
            end
            module.format({ async = true, lsp_format = "fallback", range = range })
        end, {range = true})
    end,
}
