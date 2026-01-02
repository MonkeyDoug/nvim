local au = vim.api.nvim_create_autocmd

au("BufEnter", {
  pattern = {'*.rs'},
  callback = function()
    -- Buffer Options
    -- vim.bo.cindent = true
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end
})
