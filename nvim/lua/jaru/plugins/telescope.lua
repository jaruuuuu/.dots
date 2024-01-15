return {
    {
        'nvim-telescope/telescope.nvim',

        dependencies = {
            'nvim-lua/plenary.nvim',
        },

        config = function()
            local telescope = require('telescope')

            telescope.setup({
                defaults = {
                    -- cache_picker = {num_pickers = 10},
                    dynamic_preview_title = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        vertical = {
                            width = 0.9,
                            height = 0.9,
                            preview_height = 0.6,
                            preview_cutoff = 0
                        }
                    },
                    path_display = {
                        "smart",
                        shorten = { len = 3 }
                    },
                    wrap_results = true
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            })

            telescope.load_extension('fzf')

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
        end,
    },

    {
        'nvim-telescope/telescope-symbols.nvim',
        build = ':Telescope symbols'
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
}

