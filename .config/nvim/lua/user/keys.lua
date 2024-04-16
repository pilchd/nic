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

vim.keymap.set('i', "<C-z>", "<C-o>u", {desc="Undo"})
vim.keymap.set('i', "<C-M-z>", "<C-o><C-r>", {desc="Redo"})

vim.keymap.set('n', "<CR>", [[@=(foldlevel('.')?"za":"\<lt>CR>")<CR>]])
vim.keymap.set('v', "<CR>", [[zf]])


-- Line insertion

vim.keymap.set('n', "<M-Enter>", "o<ESC>", {desc="Insert line below"})
vim.keymap.set('n', "<M-S-Enter>", "O<ESC>", {desc="Insert line above"})
vim.keymap.set('i', "<M-Enter>", "<cmd>normal o<CR>", {desc="Open line below"})
vim.keymap.set('i', "<M-S-Enter>", "<cmd>normal O<CR>", {desc="Open line above"})


-- Line editing

vim.keymap.set('n', "<M-d>", [[*``cgn]])
vim.keymap.set('v', "<M-d>", [[y<cmd>let @/=substitute(escape(@", '\'), '\n', '\\n', 'g')<CR>"_cgn]])

vim.keymap.set('i', "<C-BS>", "<C-w>")

vim.keymap.set('i', "<M-d>", "<C-o>dw", {desc="Delete word forward"})
vim.keymap.set('i', "<C-e>", "<C-o>zz", {desc="Center current line"})

vim.keymap.set('n', "<leader>i", "cc");

vim.keymap.set('v', "Y", "ygv<ESC>", {desc="Yank in-place"})

vim.keymap.set('n', "<C-CR>", "mzO<ESC>`zo<ESC>`z");
vim.keymap.set('i', "<C-CR>", "<C-o>O<CR>");
vim.keymap.set('v', "<C-CR>", "<ESC>`<O<ESC>`>o<ESC>gv");

vim.keymap.set('i', "<C-M-CR>", "{}<left><CR><C-o>O");


-- Snippets

vim.keymap.set({'i', 's'}, "<S-Enter>", function ()
    if vim.snippet.active({direction = 1}) then
        return "<cmd>lua vim.snippet.jump(1)<CR>"
    else
        return "<S-Enter>"
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


-- conform.nvim

vim.keymap.set({'n', 'v'}, "<C-f>", "<cmd>Conform<CR>")


-- fzf-lua

vim.keymap.set('n', "<leader><leader>", "<cmd>FzfLua tabs<CR>")
vim.keymap.set('n', "<leader>j", "<cmd>FzfLua buffers<CR>")
vim.keymap.set('n', "<leader>p", "<cmd>FzfLua files<CR>")

vim.keymap.set('n', "<leader>c", "<cmd>FzfLua quickfix<CR>")
vim.keymap.set('n', "<leader>l", "<cmd>FzfLua loclist<CR>")

vim.keymap.set('n', "<leader>gCi", "<cmd>FzfLua lsp_incoming_calls<CR>")
vim.keymap.set('n', "<leader>gCo", "<cmd>FzfLua lsp_outgoing_calls<CR>")
vim.keymap.set('n', "<leader>gd", "<cmd>FzfLua lsp_definitions<CR>")
vim.keymap.set('n', "<leader>gD", "<cmd>FzfLua lsp_declarations<CR>")
vim.keymap.set('n', "<leader>gh", "<cmd>FzfLua lsp_typedefs<CR>")
vim.keymap.set('n', "<leader>gi", "<cmd>FzfLua lsp_implementations<CR>")
vim.keymap.set('n', "<leader>gr", "<cmd>FzfLua lsp_references<CR>")
vim.keymap.set('n', "<leader><C-.>", "<cmd>FzfLua lsp_code_actions<CR>")

vim.keymap.set('n', "<leader>h", "<cmd>FzfLua diagnostics_document<CR>")
vim.keymap.set('n', "<leader>H", "<cmd>FzfLua diagnostics_workspace<CR>")

vim.keymap.set('n', "<leader>f", "<cmd>FzfLua grep_project<CR>")
vim.keymap.set('n', "<leader>F", "<cmd>FzfLua grep_curbuf<CR>")

vim.keymap.set('n', "<leader>sb", "<cmd>FzfLua git_branches<CR>")
vim.keymap.set('n', "<leader>sc", "<cmd>FzfLua git_commits<CR>")
vim.keymap.set('n', "<leader>sh", "<cmd>FzfLua git_stash<CR>")
vim.keymap.set('n', "<leader>ss", "<cmd>FzfLua git_status<CR>")
vim.keymap.set('n', "<leader>st", "<cmd>FzfLua git_tags<CR>")

vim.keymap.set('t', "<S-CR>", "<C-\\><C-n><cmd>FzfLua tabs<CR>")


-- mini.trailspace

vim.keymap.set('n', "<leader>t<Space>", "<cmd>lua MiniTrailspace.trim()<CR>")
vim.keymap.set('n', "<leader>t<CR>", "<cmd>lua MiniTrailspace.trim_last_lines()<CR>")


-- oil.nvim

vim.keymap.set('n', "<C-b>", ":Oil<CR>")

vim.keymap.set('i', "<C-b>", "<ESC><cmd>Oil<CR>")
