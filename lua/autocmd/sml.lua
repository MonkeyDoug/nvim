local au = vim.api.nvim_create_autocmd
local map = vim.api.nvim_buf_set_keymap
local opt = {silent = true, noremap = true}

au("BufEnter", {
  pattern = {'*.sml'},
  callback = function()
    -- Buffer Options
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.wo.conceallevel = 2
    -- map(0, 'n', '<F1>',
    --     [[<CMD>silent Neoformat | silent w | FloatermNew --disposable --autoclose=0 ./smlnj sources.mlb <CR>]],
    --     opt)
  end
})
