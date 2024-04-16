return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },

    -- https://raw.githubusercontent.com/nvim-neo-tree/neo-tree.nvim/main/lua/neo-tree/defaults.lua
    opts = {
        auto_clean_after_session_restore = true,
        close_if_last_window = true,
        hide_root_node = true,
        popup_border_style = "rounded",
        use_libuv_file_watcher = true,
        default_component_configs = {
            indent = {
                indent_size = 4,
                with_markers = false
            },
            modified = {
                symbol = "*"
            },
            name = {
                trailing_slash = true,
                use_git_status_colors = false
            },
            git_status = {
                symbols = {
                    added = 'A',
                    deleted = 'D',
                    modified = 'mod',
                    renamed = 'R',
                    untracked = '?',
                    ignored = "",
                    unstaged = 'U',
                    staged = 'S',
                    conflict = '!'
                }
            },
            window = {
                width = 32,
                height = 16
            }
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false
            }
        }
    }
}
