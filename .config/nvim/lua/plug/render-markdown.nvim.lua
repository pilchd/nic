return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-treesitter/nvim-treesitter"
    },

    opts = {
        enabled = false,
        file_types = { "markdown", "gitcommit" },
        pipe_table = {
            alignment_indicator = "·",
            filler = "Normal"
        },
        overrides = {
            buftype = {
                ["nofile"] = {
                    enabled = true
                }
            }
        }
    },
    lazy = false, keys = {
        { "<leader>m", function () require("render-markdown").buf_toggle() end }
    }
}
