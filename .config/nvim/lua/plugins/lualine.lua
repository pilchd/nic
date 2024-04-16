return {
    {
        "nvim-lualine/lualine.nvim",

        opts = {
            options = {
                icons_enabled = false,
                theme = "onedark",
                component_separators = {
                    left = "·",
                    right = "·"
                },
                globalstatus = "true"
            },
            sections = {
                lualine_a = {
                    {
                        "mode"
                    }
                },
                lualine_b = {
                    {
                        "filename"
                    },
                    {
                        "vim.fn.expand(\"#:t\")"
                    },
                    {
                        "diagnostics"
                    }
                },
                lualine_c = {
                    {
                        "branch"

                    },
                    {
                        "diff"
                    },
                    {
                        "linediag",
                    }
                },
                lualine_x = {
                    {
                        "b:gitsigns_blame_line"
                    }
                },
                lualine_y = {
                    {
                        "filetype",
                        icons_enabled = false
                    },
                    {
                        "fileformat",
                        symbols = {
                            unix = "unix",
                            dos = "DOS",
                            mac = "Mac"
                        }
                    },
                    {
                        "encoding"
                    },
                    {
                        "%n:%L"
                    }
                },
                lualine_z = {
                    {
                        "location"
                    }
                },
            }
        }
    }
}
