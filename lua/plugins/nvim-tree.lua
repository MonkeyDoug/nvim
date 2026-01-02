-- following options are the default
require('nvim-tree').setup {
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    git = {enable = true, ignore = false, timeout = 400},
    -- disables netrw completely
    disable_netrw = true,
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = true,
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    sync_root_with_cwd = false,
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
        -- enables the feature
        enable = false,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_root = true,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = {"floaterm", "help", "dashboard", "terminal", "snippets"}
    },

    view = {
        -- width of the window, can be either a number (columns) or a string in `%`
        width = 33,
    }
}

local opt = {silent = true, noremap = true}
local map = vim.api.nvim_set_keymap

map('n', '<Leader>o', ':NvimTreeToggle<CR>', opt)
-- map('n', '<Leader>r', ':NvimTreeRefresh<CR>', opt)
-- map('n', '<Leader>n', ':NvimTreeFindFile<CR>', opt)
