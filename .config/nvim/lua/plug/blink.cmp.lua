return {
    'saghen/blink.cmp',
    version = '1.*',

    opts_extend = { "sources.default" },
    opts = {
        keymap = {
            preset = "none",

            ["<C-Space>"] = {function(cmp) if not cmp.is_visible() then cmp.show() else cmp.cancel() end end },
            ["<Tab>"] = {"select_and_accept", "fallback"},
            ["<S-Tab>"] = {"select_next"},
            ["<C-S-Tab>"] = {"select_prev"},
            ["<M-S-Tab>"] = {"select_prev"},
            ["<C-j>"] = {function (cmp) cmp.scroll_documentation_down(1) end},
            ["<C-k>"] = {function (cmp) cmp.scroll_documentation_up(1) end},
        },

        completion = {
            accept = {
                auto_brackets = {
                    enabled = false
                }
            },
            menu = {
                max_height = 9,
                draw = {
                    columns = { { "kind_icon" }, { "auto", "label" }, { "source_name" }, { "kind" } },
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
            default = { 'lsp' } -- path, snippets, buffer
        }
    }
}
