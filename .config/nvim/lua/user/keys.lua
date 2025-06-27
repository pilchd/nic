-- Leader

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Tab management

vim.keymap.set('n', "<M-h>", "<cmd>tabprevious<CR>")
vim.keymap.set('n', "<M-l>", "<cmd>tabnext<CR>")

vim.keymap.set('t', "<M-h>", "<cmd>tabprevious<CR>")
vim.keymap.set('t', "<M-l>", "<cmd>tabnext<CR>")


-- Window management

vim.keymap.set('n', "<M-j>", "<C-w>h")
vim.keymap.set('n', "<M-S-j>", "<C-w>j")
vim.keymap.set('n', "<M-S-k>", "<C-w>k")
vim.keymap.set('n', "<M-k>", "<C-w>l")

vim.keymap.set('n', "<M-;>", "<C-^>")
vim.keymap.set('n', "<M-S-;>", "<C-w>p")
vim.keymap.set('n', "<M-BS>", "<C-w>g<Tab>")

vim.keymap.set('t', "<M-j>", "<cmd>wincmd h<CR>")
vim.keymap.set('t', "<M-S-j>", "<cmd>wincmd j<CR>")
vim.keymap.set('t', "<M-S-k>", "<cmd>wincmd k<CR>")
vim.keymap.set('t', "<M-k>", "<cmd>wincmd l<CR>")

vim.keymap.set('t', "<M-;>", "<cmd>buffer #<CR>")
vim.keymap.set('t', "<M-S-;>", "<cmd>wincmd p<CR>")
vim.keymap.set('t', "<M-BS>", "<cmd>tabnext #<CR>")

vim.keymap.set("n", "<leader>0", "<cmd>wincmd 1w<CR>");
vim.keymap.set("n", "<leader>9", "<cmd>wincmd 2w<CR>");
vim.keymap.set("n", "<leader>8", "<cmd>wincmd 3w<CR>");
vim.keymap.set("n", "<leader>7", "<cmd>wincmd 4w<CR>");
vim.keymap.set("n", "<leader>6", "<cmd>wincmd 5w<CR>");

vim.keymap.set('n', "<leader>z", function ()
    if vim.o.laststatus > 0
        then vim.opt.laststatus = 0
        else vim.opt.laststatus = 3
    end
end)


-- Buffer management

vim.keymap.set('n', "<C-s>", function ()
    if vim.o.modified
        then vim.cmd("silent update")
    end
end)
vim.keymap.set('i', "<C-s>", function ()
    vim.cmd("stopinsert")
    if vim.o.modified
        then vim.cmd("silent update")
    end
end)

vim.keymap.set('n', "<M-w>", "<cmd>q<CR>")
vim.keymap.set('n', "<M-W>", function ()
    vim.cmd(#vim.api.nvim_list_tabpages() > 1 and "tabclose" or "quitall")
end)

vim.keymap.set('n', "<CR>", [[@=(foldlevel('.')?"za":"\<lt>CR>")<CR>]])
vim.keymap.set('v', "<CR>", [[zf]])

vim.keymap.set('n', "<F12>", "<cmd>loadview<CR>")
vim.keymap.set('n', "<F24>", "<cmd>mkview<CR>")

vim.keymap.set('t', "<S-Esc>", "<C-\\><C-n>")


-- Line insertion

vim.keymap.set("i", "<S-CR>", "<CR><C-t>");
vim.keymap.set("i", "<M-CR>", "<CR><C-d>");
vim.keymap.set("i", "<C-CR>", "<CR><C-t><C-o>mz<CR><C-d><C-o>`z");

vim.keymap.set("i", "<C-9>", "(<CR><C-t>");
vim.keymap.set("i", "<C-0>", "<CR><C-d>)");
vim.keymap.set("i", "<C-S-0>", "<CR><C-d>);<CR>");

vim.keymap.set("i", "<C-->", "[<CR><C-t>");
vim.keymap.set("i", "<C-=>", "<CR><C-d>]");
vim.keymap.set("i", "<C-S-=>", "<CR><C-d>];<CR>");


-- Line editing

vim.keymap.set('n', "<M-d>",
    [[*``cgn]]
)
vim.keymap.set('v', "<M-d>",
    [[y<cmd>let @/=substitute(escape(@", '\'), '\n', '\\n', 'g')<CR>"_cgn]]
)

vim.keymap.set('i', "<M-d>", "<C-o>dw")

vim.keymap.set('n', "<leader>i", "cc");

vim.keymap.set('v', "Y", "ygv<Esc>")


-- Snippets

vim.keymap.set({'i', 's'}, "<S-CR>", function ()
    if vim.snippet.active({direction = 1})
        then return "<cmd>lua vim.snippet.jump(1)<CR>"
        else return "<S-CR>"
    end
end, {expr = true})
vim.keymap.set({'i', 's'}, "<S-BS>", function ()
    if vim.snippet.active({direction = -1})
        then return "<cmd>lua vim.snippet.jump(-1)<CR>"
        else return "<S-BS>"
    end
end, {expr = true})


-- Command line

vim.keymap.set('n', "<leader><CR>", ":")


-- Search

vim.keymap.set('n', "<leader><BS>", "<cmd>nohlsearch<CR>")
