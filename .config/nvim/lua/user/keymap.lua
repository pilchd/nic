-- Tab management

vim.keymap.set('n', "<M-h>", "<Cmd>tabprevious<CR>")
vim.keymap.set('n', "<M-l>", "<Cmd>tabnext<CR>")

vim.keymap.set('t', "<M-h>", "<Cmd>tabprevious<CR>")
vim.keymap.set('t', "<M-l>", "<Cmd>tabnext<CR>")


-- Window management

vim.keymap.set({'n', 't'}, "<M-j>", "<Cmd>wincmd h<CR>")
vim.keymap.set({'n', 't'}, "<M-S-j>", "<Cmd>wincmd j<CR>")
vim.keymap.set({'n', 't'}, "<M-S-k>", "<Cmd>wincmd k<CR>")
vim.keymap.set({'n', 't'}, "<M-k>", "<Cmd>wincmd l<CR>")

vim.keymap.set({'n', 't'}, "<M-;>", "<Cmd>buffer #<CR>")
vim.keymap.set({'n', 't'}, "<M-S-;>", "<Cmd>wincmd p<CR>")
vim.keymap.set({'n', 't'}, "<M-BS>", "<Cmd>tabnext #<CR>")

vim.keymap.set("n", "<Leader>0", "<Cmd>wincmd 1w<CR>");
vim.keymap.set("n", "<Leader>9", "<Cmd>wincmd 2w<CR>");
vim.keymap.set("n", "<Leader>8", "<Cmd>wincmd 3w<CR>");
vim.keymap.set("n", "<Leader>7", "<Cmd>wincmd 4w<CR>");
vim.keymap.set("n", "<Leader>6", "<Cmd>wincmd 5w<CR>");

vim.keymap.set('n', "<Leader>z", function ()
    if vim.o.laststatus > 0
        then vim.opt.laststatus = 0
        else vim.opt.laststatus = 3
    end
end)


-- Buffer management

vim.keymap.set({'n', 'i'}, "<C-s>", function ()
    if vim.fn.mode() == 'i' then vim.cmd "stopinsert" end
    if vim.bo.modified then vim.cmd "silent update" end
end)

vim.keymap.set('n', "<M-w>", "<Cmd>quit<CR>")
vim.keymap.set('n', "<M-W>", function ()
    vim.cmd(#vim.api.nvim_list_tabpages() > 1 and "tabclose" or "quitall")
end)

vim.keymap.set('n', "<CR>", [[@=(foldlevel('.')?"za":"\<lt>CR>")<CR>]])
vim.keymap.set('v', "<CR>", [[zf]])

vim.keymap.set('t', "<S-Esc>", "<C-\\><C-n>")


-- Line editing

vim.keymap.set('i', "<C-CR>", "<C-o>o");
vim.keymap.set('i', "<M-CR>", "<C-o>O");

vim.keymap.set('v', "Y", "ygv<Esc>")
vim.keymap.set('v', "gc", "gcgv<Esc>")

vim.keymap.set('n', "<Leader>i", "cc");


vim.keymap.set('n', "<M-d>",
    [[*``cgn]]
)
vim.keymap.set('v', "<M-d>",
    [[y<Cmd>let @/=substitute(escape(@", '\'), '\n', '\\n', 'g')<CR>"_cgn]]
)


-- Snippets

vim.keymap.set({'i', 's'}, "<S-CR>", function ()
    if vim.snippet.active({direction = 1})
        then return "<Cmd>lua vim.snippet.jump(1)<CR>"
        else return PILCHD_stepover()
    end
end, { expr = true, silent = true })
vim.keymap.set({'i', 's'}, "<S-BS>", function ()
    if vim.snippet.active({direction = -1})
        then return "<Cmd>lua vim.snippet.jump(-1)<CR>"
        else return "<Cmd>normal! dh<CR>"
    end
end, { expr = true, silent = true })

function PILCHD_stepover()
    local char = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("."))[1]

    if vim.tbl_contains({')', '>', ']', '}'}, char)
        then return "<Right>"
        else return "<Space>"
    end
end


-- Search

vim.keymap.set('n', "<Leader><BS>", "<Cmd>nohlsearch<CR>")

vim.keymap.set('n', "<Leader>C", function () vim.Cmd("cclose") end)
vim.keymap.set('n', "<Leader>L", function () vim.Cmd("lclose") end)
