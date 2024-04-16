-- Leader

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Tab management

vim.keymap.set('n', "<M-h>", ":tabprevious<CR>", {desc="Focus tab previous"})
vim.keymap.set('n', "<M-l>", ":tabnext<CR>", {desc="Focus tab next"})


-- Window management

vim.keymap.set('n', "<M-j>", "<C-w>h", {desc="Focus window left"})
vim.keymap.set('n', "<M-C-j>", "<C-w>j", {desc="Focus window down"})
vim.keymap.set('n', "<M-C-k>", "<C-w>k", {desc="Focus window up"})
vim.keymap.set('n', "<M-k>", "<C-w>l", {desc="Focus window right"})

vim.keymap.set('n', "<M-;>", "<C-^>", {desc="Focus alternate file"})
vim.keymap.set('n', "<M-C-;>", "<C-w><C-p>", {desc="Focus alternate window"})
vim.keymap.set('n', "<M-BS>", "g<Tab>", {desc="Focus alternate tab"})


-- Terminal window management

vim.keymap.set('t', "<Esc>", "<C-\\><C-n>")

vim.keymap.set('t', "<M-j>", "<Cmd>wincmd h<CR>", {desc="Focus window left"})
vim.keymap.set('t', "<M-C-j>", "<Cmd>wincmd j<CR>", {desc="Focus window down"})
vim.keymap.set('t', "<M-C-k>", "<Cmd>wincmd k<CR>", {desc="Focus window up"})
vim.keymap.set('t', "<M-k>", "<Cmd>wincmd l<CR>", {desc="Focus window right"})

--vim.keymap.set('t', "<M-;>", "<C-\\><C-n><C-^>", {desc="Focus alternate file"})
--vim.keymap.set('t', "<M-C-;>", "<C-\\><C-n><C-w><C-p>", {desc="Focus alternate window"})
--vim.keymap.set('t', "<M-BS>", "<C-\\><C-n>g<Tab>", {desc="Focus alternate tab"})


-- Buffer management

vim.keymap.set('n', "<C-n>", ":enew<CR>")
vim.keymap.set('n', "<C-q>", ":q<CR>")

vim.keymap.set('n', "<C-s>", ":update<CR>")
vim.keymap.set('i', "<C-s>", "<Esc>:update<CR>")

vim.keymap.set('i', "<C-z>", "<C-o>u", {desc="Undo"})
vim.keymap.set('i', "<C-M-z>", "<C-o><C-r>", {desc="Redo"})


-- Line insertion

vim.keymap.set('n', "<C-Enter>", "mzo<Esc>`z", {desc="Insert line below"})
vim.keymap.set('n', "<C-M-Enter>", "mzO<Esc>`z", {desc="Insert line above"})
vim.keymap.set('i', "<C-Enter>", "<C-o>o", {desc="Open line below"})
vim.keymap.set('i', "<C-M-Enter>", "<C-o>O", {desc="Open line above"})


-- Line movement

--vim.keymap.set('n', "<C-j>", ":m+1<CR>==", {desc="Move line down"})
--vim.keymap.set('n', "<C-k>", ":m-2<CR>==", {desc="Move line up"})
--vim.keymap.set('i', "<C-j>", "<Esc>:m+1<CR>==gi", {desc="Move line down"})
--vim.keymap.set('i', "<C-k>", "<Esc>:m-2<CR>==gi", {desc="Move line up"})
--vim.keymap.set('v', "<C-j>", ":'<,'>m'>+1<CR>gv=gv", {desc="Move selection down"})
--vim.keymap.set('v', "<C-k>", ":'<,'>m'<-2<CR>gv=gv", {desc="Move selection up"})


-- Line editing

vim.keymap.set('i', "<M-d>", "<C-o>dw", {desc="Delete word forward"})
vim.keymap.set('i', "<C-e>", "<C-o>zz", {desc="Center current line"})


-- Search

vim.keymap.set('n', "<Esc>", ":nohlsearch<CR>")


-- Diagnostics

vim.keymap.set('n', "<leader>d", function() vim.diagnostic.open_float() end)


-- fzf-lua

vim.keymap.set('n', "<leader>f", ":FzfLua buffers<CR>")
vim.keymap.set('n', "<leader>p", ":FzfLua files<CR>")
vim.keymap.set('n', "<leader>g", ":FzfLua tabs<CR>")
