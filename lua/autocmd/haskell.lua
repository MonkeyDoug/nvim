local au = vim.api.nvim_create_autocmd

au("BufEnter", {
    pattern = '*.hs',
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
    end
})
