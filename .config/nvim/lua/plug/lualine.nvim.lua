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
                        end, type = "lua_expr"
                    }
                },
                lualine_b = {
                    {
                        "filename",
                        path = 1
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
                        -- vim.o.shortmess .. "S"
                        function ()
                            if vim.api.nvim_get_vvar("hlsearch") == 1 then
                                local res = vim.fn.searchcount({maxcount = 99, timeout = 500})

                                if res.total > 0 then
                                    return string.format("%02d / %02d", res.current, res.total)
                                end
                            end
                            return ""
                        end, type = "lua_expr"
                    },
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
