-- Global status line
-- Reuse open buffers from quickfix
--vim.opt.clipboard = "unnamedplus"
--vim.opt.mouse = "nvi"
--vim.opt.splitbelow = true
--vim.opt.splitright = true
--vim.opt.timeoutlen = 225
--vim.opt.updatetime = 250

vim.g.have_nerd_font = true


-- Buffers

vim.opt.formatoptions:remove('o')
vim.opt.inccommand = "split"
--vim.opt.list = true
--vim.opt.listchars = {trail='·'}
vim.opt.pumheight = 12
vim.opt.scrolloff = 3
vim.opt.switchbuf = "usetab"
vim.opt.undofile = true


-- Gutter

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"


-- Indentation

-- vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4


-- Search

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Status line

vim.opt.cmdheight=0
vim.opt.laststatus = 3
vim.opt.shortmess:append({I=true})
--vim.opt.showmode = false

vim.diagnostic.config {
    float = {
        --border = "rounded",
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
