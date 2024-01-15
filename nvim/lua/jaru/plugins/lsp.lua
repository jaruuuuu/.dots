return {
    'VonHeikemen/lsp-zero.nvim',

    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',

        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },

    config = function()
        local lsp = require('lsp-zero')

        lsp.preset('recommended')

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'rust_analyzer',
            },
        })

        lsp.set_preferences({
            sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I',
            }
        })

        local cmp = require('cmp')

        local cmp_mappings = lsp.defaults.cmp_mappings({
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<Tab>'] = nil,
            ['<S-Tab>'] = nil,
        })

        vim.diagnostic.config({
            virtual_text = true,
        })

        lsp.on_attach(function(client, bufnr)
        	local opts = {buffer = bufnr, remap = false}
            local builtin = require('telescope.builtin')

        	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        	vim.keymap.set('n', 'fd', builtin.lsp_definitions, opts)
        	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        	vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        	vim.keymap.set('n', '<leader>fws', builtin.lsp_workspace_symbols, opts)

        	vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        	vim.keymap.set('n', '<leader>fd', builtin.diagnostics, opts)

            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

        	vim.keymap.set('n', '<leader>vc', vim.lsp.buf.code_action, opts)
        	vim.keymap.set('n', '<leader>vr', vim.lsp.buf.references, opts)
        	vim.keymap.set('n', '<leader>fr', builtin.lsp_references, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

            vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        end)

        lsp.configure(
            'lua_ls',
            {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {"vim"},
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    }
                }
            }
        )

        local rust_lsp = lsp.build_options('rust_analyzer', {})

        lsp.setup()

        -- Initialize rust_analyzer with rust-tools
        require('rust-tools').setup({
            tools = {
                -- These apply to the default RustSetInlayHints command
                inlay_hints = {
                }
            },
            server = rust_lsp,
        })

    end,
}
