return {
    "https://github.com/nvim-mini/mini.trailspace",

    opts = {},
    keys = {
        {'n', "<Leader>t<Space>", function () MiniTrailspace.trim() end},
        {'n', "<Leader>t<CR>", function () MiniTrailspace.trim_last_lines() end},
    },
}
