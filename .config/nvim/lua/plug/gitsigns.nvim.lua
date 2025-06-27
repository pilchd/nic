return {
    "lewis6991/gitsigns.nvim",

    opts = {
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = false,
            virt_text_pos = "right_align"
        },
        current_line_blame_formatter = function(name, blame_info)
            local author = blame_info.committer
            if author == "You" then author = name end

            return {
                {
                    string.format(
                        "%s · %s & %s · %s",
                        blame_info.abbrev_sha,
                        author,
                        blame_info.committer,
                        os.date("%Y-%m-%d %H:%M", blame_info.committer_time)
                    ),
                    "GitSignsCurrentLineBlame"
                }
            }
        end
    }
}
