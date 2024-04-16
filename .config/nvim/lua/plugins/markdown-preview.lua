return {
    "iamcco/markdown-preview.nvim",
    cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
    ft = {"markdown"},
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_refresh_slow = 1
        vim.g.mkdp_echo_preview_url = 1
        vim.g.mkdp_page_title = "${name}.md"
        vim.g.mkdp_combine_preview = 1
    end
}
