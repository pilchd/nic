local g = vim.g
local set = vim.opt

g.have_nerd_font = true

set.winborder = "rounded"

set.breakindent = true
set.clipboard = "unnamedplus"
set.cmdheight = 0
set.cpoptions:append('I')
set.cursorline = true
set.cursorlineopt = "number"
set.expandtab = true
set.foldcolumn = "auto:3"
set.formatoptions:remove('o')
set.hlsearch = true
set.ignorecase = true
set.inccommand = "split"
set.laststatus = 3
set.listchars = {trail='·'}
set.number = true
set.numberwidth = 3
set.pumheight = 12
set.relativenumber = true
set.scrolloff = 3
set.shiftwidth = 0
set.showmode = false
set.showtabline = 0;
set.signcolumn = "yes:1"
set.smartcase = true
set.softtabstop = -1
set.splitbelow = true
set.splitright = true
set.switchbuf = "usetab"
set.tabstop = 4
set.timeoutlen = 2000
set.undofile = true

vim.diagnostic.config {
    float = {
        format = function(diagnostic)
            return string.format("%s",
                diagnostic.message
                --diagnostic.source,
                --diagnostic.code or diagnostic.user_data.lsp.code
            )
        end
    },
    virtual_text = false
    --virtual_text = {
    --    virt_text_pos = "right_align"
    --}
}
