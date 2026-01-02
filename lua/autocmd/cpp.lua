local au = vim.api.nvim_create_autocmd
local map = vim.api.nvim_buf_set_keymap
local opt = {silent = true, noremap = true}

au("BufEnter", {
  pattern = {'*.cpp', '*.c'},
  callback = function()
    -- Buffer Options
    vim.bo.cindent = true -- Enables automatic indenting for C and C++ filetypes
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    -- Compilation mappings
    map(0, 'n', '<F1>',
        [[<CMD>silent Neoformat | silent w | FloatermNew --disposable --autoclose=0 cpt -a <CR>]],
        opt)
    map(0, 'n', '<F2>',
        [[<CMD>silent Neoformat | silent w | FloatermNew --disposable --autoclose=0 cpt -ad <CR>]],
        opt)
    map(0, 'n', '<F3>', [[<CMD>lua CPTCase()<CR>]], opt)
    map(0, 'n', '<Leader>m',
        [[<CMD>silent Neoformat | silent w | FloatermNew --disposable --autoclose=0 cpmake % <CR>]],
        opt)
    map(0, 'n', '<Leader>g',
        [[<CMD>silent Neoformat | silent w | FloatermNew --disposable --autoclose=0 cpmake % exe exe <CR>]],
        opt)
    map(0, 'n', '<Leader>h',
        [[<CMD>silent Neoformat | silent w | FloatermNew --disposable --autoclose=0 cpmake % debug exe <CR>]],
        opt)
  end
})
