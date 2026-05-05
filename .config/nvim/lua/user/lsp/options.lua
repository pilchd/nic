vim.diagnostic.config {
    float = {
        format = function (diagnostic)
            return string.format("%s",
                diagnostic.message
                --diagnostic.source,
                --diagnostic.code or diagnostic.user_data.lsp.code
            )
        end
    },
    virtual_text = false,
    --virtual_text = {
    --    virt_text_pos = "right_align"
    --}
}
