-- Leader

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Tab management

vim.keymap.set('n', "<M-h>", ":tabprevious<CR>", {desc="Focus tab previous"})
vim.keymap.set('n', "<M-l>", ":tabnext<CR>", {desc="Focus tab next"})

vim.keymap.set('i', "<M-h>", "<Cmd>tabprevious<CR>", {desc="Focus tab previous"})
vim.keymap.set('i', "<M-l>", "<Cmd>tabnext<CR>", {desc="Focus tab next"})

vim.keymap.set('t', "<M-h>", "<Cmd>tabprevious<CR>", {desc="Focus tab previous"})
vim.keymap.set('t', "<M-l>", "<Cmd>tabnext<CR>", {desc="Focus tab next"})


-- Window management

vim.keymap.set('n', "<M-j>", "<C-w>h", {desc="Focus window left"})
vim.keymap.set('n', "<M-C-j>", "<C-w>j", {desc="Focus window down"})
vim.keymap.set('n', "<M-C-k>", "<C-w>k", {desc="Focus window up"})
vim.keymap.set('n', "<M-k>", "<C-w>l", {desc="Focus window right"})

vim.keymap.set('n', "<M-;>", "<C-w>p", {desc="Focus alternate window"})
vim.keymap.set('n', "<M-C-;>", "<C-^>", {desc="Focus alternate file"})
vim.keymap.set('n', "<M-BS>", "g<Tab>", {desc="Focus alternate tab"})

vim.keymap.set('i', "<M-j>", "<C-o><C-w>h", {desc="Focus window left"})
vim.keymap.set('i', "<M-C-j>", "<C-o<C-w>j", {desc="Focus window down"})
vim.keymap.set('i', "<M-C-k>", "<C-o<C-w>k", {desc="Focus window up"})
vim.keymap.set('i', "<M-k>", "<C-o><C-w>l", {desc="Focus window right"})

vim.keymap.set('i', "<M-;>", "<C-o><C-w>p", {desc="Focus alternate window"})
vim.keymap.set('i', "<M-C-;>", "<C-o><C-^>", {desc="Focus alternate file"})
vim.keymap.set('i', "<M-BS>", "<C-o>g<Tab>", {desc="Focus alternate tab"})

vim.keymap.set('t', "<M-\\>", "<C-\\><C-n>")

vim.keymap.set('t', "<M-j>", "<Cmd>wincmd h<CR>", {desc="Focus window left"})
vim.keymap.set('t', "<M-C-j>", "<Cmd>wincmd j<CR>", {desc="Focus window down"})
vim.keymap.set('t', "<M-C-k>", "<Cmd>wincmd k<CR>", {desc="Focus window up"})
vim.keymap.set('t', "<M-k>", "<Cmd>wincmd l<CR>", {desc="Focus window right"})

vim.keymap.set('t', "<M-;>", "<Cmd>wincmd p<CR>", {desc="Focus alternate window"})
vim.keymap.set('t', "<M-C-;>", "<Cmd>wincmd ^<CR>", {desc="Focus alternate file"})


-- Buffer management

vim.keymap.set('n', "<C-n>", ":enew<CR>")
vim.keymap.set('n', "<C-q>", ":q<CR>")

vim.keymap.set('n', "<C-s>", ":update<CR>")
vim.keymap.set('i', "<C-s>", "<Esc>:update<CR>")

vim.keymap.set('i', "<C-z>", "<C-o>u", {desc="Undo"})
vim.keymap.set('i', "<C-M-z>", "<C-o><C-r>", {desc="Redo"})


-- Line insertion

vim.keymap.set('n', "<M-Enter>", "o<Esc>", {desc="Insert line below"})
vim.keymap.set('n', "<M-S-Enter>", "O<Esc>", {desc="Insert line above"})
vim.keymap.set('i', "<M-Enter>", "<Cmd>normal o<CR>", {desc="Open line below"})
vim.keymap.set('i', "<M-S-Enter>", "<Cmd>normal O<CR>", {desc="Open line above"})


-- Line editing

vim.keymap.set('i', "<M-d>", "<C-o>dw", {desc="Delete word forward"})
vim.keymap.set('i', "<C-e>", "<C-o>zz", {desc="Center current line"})

vim.keymap.set('v', "Y", "ygv<Esc>", {desc="Yank in-place"})


-- Snippets

vim.keymap.set({'i', 's'}, "<S-Enter>", function ()
    if vim.snippet.active({direction = 1}) then
        return "<Cmd>lua vim.snippet.jump(1)<CR>"
    else
        return "<S-Enter>"
    end
end, {expr = true})
vim.keymap.set({'i', 's'}, "<S-BS>", function ()
    if vim.snippet.active({direction = -1}) then
        return "<Cmd>lua vim.snippet.jump(-1)<CR>"
    else
        return "<S-BS>"
    end
end, {expr = true})


-- Command line

vim.keymap.set('n', "<leader><leader>", ":", {desc="Start ex command"})
vim.keymap.set('n', "<leader>s", ":! ", {desc="Start shell command"})
vim.keymap.set('n', "<leader>r", ":r! ", {desc="Start read-in shell command"})


-- Search

vim.keymap.set('n', "<leader>/", "<Cmd>nohlsearch<CR>")


-- Diagnostics

vim.keymap.set('n', "<leader>d", function() vim.diagnostic.open_float() end)


-- fzf-lua

vim.keymap.set('n', "<leader>f", ":FzfLua buffers<CR>")
vim.keymap.set('n', "<leader>p", ":FzfLua files<CR>")
vim.keymap.set('n', "<leader>g", ":FzfLua tabs<CR>")


-- oil.nvim

vim.keymap.set('n', "<C-b>", ":Oil<CR>")

vim.keymap.set('i', "<C-b>", "<Esc><Cmd>Oil<CR>")


-- toggleterm.nvim

vim.keymap.set('n', "<C-=>", "<Cmd>1TermExec cmd='' go_back=0<CR>")
vim.keymap.set('n', "<M-=>", "<Cmd>1TermExec cmd='clear' go_back=0<CR>")

vim.keymap.set('i', "<C-=>", "<Cmd>1TermExec cmd='' go_back=0<CR>")
vim.keymap.set('i', "<M-=>", "<Cmd>1TermExec cmd='clear' go_back=0<CR>")

vim.keymap.set('n', "<leader>tb", ":1TermExec cmd='t_b'<CR>")
vim.keymap.set('n', "<leader>tr", ":1TermExec cmd='t_r'<CR>")
vim.keymap.set('n', "<leader>tc", ":1TermExec cmd='t_c' open=0<CR>")
