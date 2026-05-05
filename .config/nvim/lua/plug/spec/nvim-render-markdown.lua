return {
    {
        src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
        data = {
            module_name = "render-markdown",
        },
    },

    opts = {
        enabled = false,
        file_types = {"gitcommit", "markdown"},
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
    keys = function (spec)
        local plug = require "render-markdown"

        return {
            {"n", "<leader>m", plug.buf_toggle}
        }
    end,
}
