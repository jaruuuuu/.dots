vim.g.mapleader = ' '

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- move around in wrapped lines
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('v', '<Up>', 'gk')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('v', '<Down>', 'gj')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- don't clobber the register when pasting
vim.keymap.set('v', 'p', '"_dp')
vim.keymap.set('v', 'P', '"_dP')
-- or when deleting
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- yanks go into system clipboad too
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>s',
    ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

vim.keymap.set('i', '<C-x>', '<Del>')

