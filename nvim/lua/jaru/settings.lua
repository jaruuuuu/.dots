vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = 'yes'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.magic = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 5
vim.opt.whichwrap = vim.o.whichwrap .. '<>[]'
vim.opt.breakindent = true
-- vim.opt.breakindentopt = 'min:40,sbr'
-- vim.opt.showbreak = '...'
vim.opt.linebreak = true
vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.updatetime = 50

