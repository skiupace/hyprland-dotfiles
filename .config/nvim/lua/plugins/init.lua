return {
    {
        -- create code images
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        config = function()
            require("silicon").setup {
                font = "JetBrainsMono Nerd Font Propo=34;Noto Color Emoji=34",
                theme = "catppuccin-mocha",
                debug = false,
            }
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "typescript-language-server",
                "tailwindcss-language-server",
                "eslint-lsp",
                "js-debug-adapter",
                "emmet-language-server",
                "pyright",
                "mypy",
                "ruff",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "javascript",
                "typescript",
                "python",
                "c",
            },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "html",
            "markdown",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    -- {
    --     "SmiteshP/nvim-navic",
    --     event = "LspAttach",
    --     config = function()
    --         dofile(vim.g.base46_cache .. "navic")
    --
    --         require("nvim-navic").setup {
    --             highlight = true,
    --             lsp = { auto_attach = true },
    --         }
    --
    --         vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    --     end,
    -- },
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     ft = {"python"},
    --     opts = function ()
    --         return require "configs.null-ls"
    --     end,
    -- }
}
