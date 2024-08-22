return {
    "christoomey/vim-tmux-navigator",
    vim.keymap.set('n', 'C-h', ':TemuxNavigateLeft<CR>'),
    vim.keymap.set('n', 'C-j', ':TemuxNavigateDown<CR>'),
    vim.keymap.set('n', 'C-k', ':TemuxNavigateUp<CR>'),
    vim.keymap.set('n', 'C-l', ':TemuxNavigateRight<CR>')
}
