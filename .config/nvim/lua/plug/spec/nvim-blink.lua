return {
    {
        src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1"),
    },

    -- https://cmp.saghen.dev/configuration/reference.html
    opts = {
        enabled = function ()
            return not vim.g.pilchd_zen
        end,

        keymap = {
            preset = "none",

            ["<C-Space>"] = {function(cmp) if not cmp.is_visible() then cmp.show() else cmp.cancel() end end},
            ["<Tab>"] = {"select_and_accept", "fallback"},
            ["<S-Tab>"] = {"select_next"},
            ["~"] = {"select_prev", "fallback"},
            ["<C-j>"] = {function (cmp) cmp.scroll_documentation_down(1) end},
            ["<C-k>"] = {function (cmp) cmp.scroll_documentation_up(1) end},
        },

        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                },
            },
            accept = {
                auto_brackets = {
                    enabled = false
                }
            },
            menu = {
                draw = {
                    columns = {{ "label", "auto", gap = 2 }, { "kind" }},
                    components = {
                        auto = {
                            text = function(ctx)
                                return #ctx.label_description > 0 and "~" or ""
                            end
                        }
                    }
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 220
            }
        },

        signature = {
            enabled = true,
            window = {
                show_documentation = true
            }
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        sources = {
            default = { "lsp", "snippets" } -- path, snippets, buffer
        },
    },
}
