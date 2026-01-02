local au = vim.api.nvim_create_autocmd

au("BufEnter", {
    pattern = {'*.js', '*.ts', '*.tsx', '*.css', '*.scss', '*.html'},
    callback = function()
        -- Buffer Options
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
    end
})
