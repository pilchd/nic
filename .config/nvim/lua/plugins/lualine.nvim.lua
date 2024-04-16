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
                    },
                    {
                        function ()
                            if #vim.fn.reg_recording() > 0 then
                                return '"' .. vim.fn.reg_recording()
                            else
                                return ""
                            end
                        end
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
                        max_length = 120
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
