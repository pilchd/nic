return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    opts = {
        columns = {"mtime", "icon"},
        view_options = {
            show_hidden = true,
            is_always_hidden = function (name, bufnr)
                for _, check in ipairs({".", "..", ".git"}) do
                    if name == check then return true end
                end
                return false
            end
        }
    }
}
