return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function ()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "c",
                "css",
                "go",
                "hcl",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "lua",
                "typescript",
                "yaml"
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true
            },
            indent = {
                enable = false
            }
        }
    end
}
