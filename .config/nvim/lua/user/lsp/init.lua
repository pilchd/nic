require "user.lsp.autocommand"
require "user.lsp.keymap"
require "user.lsp.options"

require "user.lsp.config"

vim.lsp.enable {
    "jsonls", "lua_ls", "vtsls"
}
