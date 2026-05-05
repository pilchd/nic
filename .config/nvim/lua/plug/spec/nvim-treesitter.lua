return {
    "https://github.com/nvim-treesitter/nvim-treesitter",

    init = function ()
        local plug   = require "nvim-treesitter"
        local config = require "nvim-treesitter.config"

        local installed = config.get_installed()
        local ensure_installed = {
            "bash",
            "c", "cpp",
            "css",
            "gitcommit",
            "go",
            "hcl",
            "html",
            "javascript", "jsx", "jsdoc",
            "jq",
            "json",
            "lua",
            "markdown", "markdown_inline",
            "rust",
            "typescript", "tsx",
            "yaml",
        }

        plug.install(
            vim.iter(ensure_installed)
            :filter(function (parser)
                return not vim.tbl_contains(installed, parser)
            end)
            :totable()
        )

        -- https://www.reddit.com/r/neovim/comments/1kuj9xm/has_anyone_successfully_switched_to_the_new/mv93w7h/
        vim.api.nvim_create_autocmd("FileType", {
            callback = function ()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
