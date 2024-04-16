return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({with_sync=true})()
    end,

    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "c",
                "css",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "typescript",
                "yaml"
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true
            }
        }
    end
}
