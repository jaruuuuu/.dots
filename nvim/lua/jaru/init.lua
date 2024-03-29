require('jaru.keymaps')
require('jaru.settings')
require('jaru.autocmds')

-- https://github.com/folke/lazy.nvim

-- bootstrap
local lazypath = vim.fn.stdpath('data') .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- add setup
require('lazy').setup('jaru.plugins')
require('catppuccin').load()
