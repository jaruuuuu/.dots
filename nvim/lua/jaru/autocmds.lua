
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local jaru_group = augroup('jaru', {})

autocmd({'BufWritePre'}, {
    group = jaru_group,
    pattern = '*',
    command = '%s/\\s\\+$//e'
})

autocmd({'TextYankPost'}, {
    group = jaru_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 75,
        })
    end
})

