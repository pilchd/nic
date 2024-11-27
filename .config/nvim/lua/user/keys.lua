-- Leader

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Tab management

vim.keymap.set('n', "<M-h>", ":tabprevious<CR>", {desc="Focus tab previous"})
vim.keymap.set('n', "<M-l>", ":tabnext<CR>", {desc="Focus tab next"})

vim.keymap.set('i', "<M-h>", "<cmd>tabprevious<CR>", {desc="Focus tab previous"})
vim.keymap.set('i', "<M-l>", "<cmd>tabnext<CR>", {desc="Focus tab next"})

vim.keymap.set('t', "<M-h>", "<cmd>tabprevious<CR>", {desc="Focus tab previous"})
vim.keymap.set('t', "<M-l>", "<cmd>tabnext<CR>", {desc="Focus tab next"})


-- Window management

vim.keymap.set('n', "<M-j>", "<C-w>h", {desc="Focus window left"})
vim.keymap.set('n', "<M-S-j>", "<C-w>j", {desc="Focus window down"})
vim.keymap.set('n', "<M-S-k>", "<C-w>k", {desc="Focus window up"})
vim.keymap.set('n', "<M-k>", "<C-w>l", {desc="Focus window right"})

vim.keymap.set('n', "<M-;>", "<C-^>", {desc="Focus alternate file"})
vim.keymap.set('n', "<M-S-;>", "<C-w>p", {desc="Focus alternate window"})
vim.keymap.set('n', "<M-BS>", "g<Tab>", {desc="Focus alternate tab"})

vim.keymap.set('i', "<M-j>", "<C-o><C-w>h", {desc="Focus window left"})
vim.keymap.set('i', "<M-S-j>", "<C-o<C-w>j", {desc="Focus window down"})
vim.keymap.set('i', "<M-S-k>", "<C-o<C-w>k", {desc="Focus window up"})
vim.keymap.set('i', "<M-k>", "<C-o><C-w>l", {desc="Focus window right"})

vim.keymap.set('i', "<M-;>", "<C-o><C-^>", {desc="Focus alternate file"})
vim.keymap.set('i', "<M-S-;>", "<C-o><C-w>p", {desc="Focus alternate window"})
vim.keymap.set('i', "<M-BS>", "<C-o>g<Tab>", {desc="Focus alternate tab"})

vim.keymap.set('t', "<S-ESC>", "<C-\\><C-n>")

vim.keymap.set('t', "<M-j>", "<cmd>wincmd h<CR>", {desc="Focus window left"})
vim.keymap.set('t', "<M-S-j>", "<cmd>wincmd j<CR>", {desc="Focus window down"})
vim.keymap.set('t', "<M-S-k>", "<cmd>wincmd k<CR>", {desc="Focus window up"})
vim.keymap.set('t', "<M-k>", "<cmd>wincmd l<CR>", {desc="Focus window right"})

vim.keymap.set('t', "<M-;>", "<cmd>buffer #<CR>", {desc="Focus alternate file"})
vim.keymap.set('t', "<M-S-;>", "<cmd>wincmd p<CR>", {desc="Focus alternate window"})
vim.keymap.set('t', "<M-BS>", "<cmd>tabnext #<CR>", {desc="Focus alternate tab"})


-- Buffer management

vim.keymap.set('n', "<C-n>", ":enew<CR>")
vim.keymap.set('n', "<C-q>", ":q<CR>")

vim.keymap.set('n', "<C-s>", "<cmd>update<CR>")
vim.keymap.set('i', "<C-s>", "<ESC><cmd>update<CR>")

vim.keymap.set('n', "<CR>", [[@=(foldlevel('.')?"za":"\<lt>CR>")<CR>]])
vim.keymap.set('v', "<CR>", [[zf]])

vim.keymap.set('n', "<F12>", "<cmd>mkview<CR>")
vim.keymap.set('n', "<F24>", "<cmd>loadview<CR>")


-- Line insertion

vim.keymap.set('n', "<M-CR>", "o<ESC>", {desc="Open line below"})
vim.keymap.set('n', "<M-S-CR>", "O<ESC>", {desc="Open line above"})
vim.keymap.set('i', "<M-CR>", "<cmd>normal o<CR>", {desc="Open line below"})
vim.keymap.set('i', "<M-S-CR>", "<cmd>normal O<CR>", {desc="Open line above"})

vim.keymap.set('n', "<C-CR>", "mzO<ESC>`zo<ESC>`z");
vim.keymap.set('i', "<C-CR>", "<ESC>mzO<ESC>`zo<ESC>`za");
vim.keymap.set('v', "<C-CR>", "<ESC>`<O<ESC>`>o<ESC>gv");


-- Line editing

vim.keymap.set('n', "<M-d>", [[*``cgn]])
vim.keymap.set('v', "<M-d>", [[y<cmd>let @/=substitute(escape(@", '\'), '\n', '\\n', 'g')<CR>"_cgn]])

vim.keymap.set('i', "<C-BS>", "<C-w>")

vim.keymap.set('i', "<M-d>", "<C-o>dw", {desc="Delete word forward"})
vim.keymap.set('i', "<C-e>", "<C-o>zz", {desc="Center current line"})

vim.keymap.set('n', "<leader>i", "cc");

vim.keymap.set('v', "Y", "ygv<ESC>", {desc="Yank in-place"})


-- Snippets

vim.keymap.set({'i', 's'}, "<S-CR>", function ()
    if vim.snippet.active({direction = 1}) then
        return "<cmd>lua vim.snippet.jump(1)<CR>"
    else
        return "<S-CR>"
    end
end, {expr = true})
vim.keymap.set({'i', 's'}, "<S-BS>", function ()
    if vim.snippet.active({direction = -1}) then
        return "<cmd>lua vim.snippet.jump(-1)<CR>"
    else
        return "<S-BS>"
    end
end, {expr = true})


-- Command line

vim.keymap.set('n', "<leader><CR>", ":", {desc="Start ex command"})
vim.keymap.set('n', "<leader><ESC>", ":! ", {desc="Start shell command"})


-- Search

vim.keymap.set('n', "<leader><BS>", "<cmd>nohlsearch<CR>")
