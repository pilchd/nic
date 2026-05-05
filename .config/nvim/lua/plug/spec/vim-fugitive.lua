return {
    "https://github.com/tpope/vim-fugitive",

    keys = {
        -- https://github.com/tpope/vim-fugitive/issues/1451#issuecomment-770310789
        "au User FugitiveIndex map <buffer> dt :Gtabedit <Plug><cfile><Bar>Gdiffsplit<CR>",

        {'n', "<F9>", function () vim.cmd("tab Git") end},
        {'n', "<Leader><C-g>", function () vim.cmd("top vertical Git | vertical resize 50") end}
    },
}
