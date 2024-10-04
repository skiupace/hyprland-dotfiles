return {
    {
        -- create code images
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        config = function()
            require("silicon").setup {
                font = "JetBrainsMono Nerd Font Propo=34;Noto Color Emoji=34",
                theme = "gruvbox-dark",
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
    {
        "SmiteshP/nvim-navic",
        event = "LspAttach",
        config = function()
            dofile(vim.g.base46_cache .. "navic")

            require("nvim-navic").setup {
                highlight = true,
                lsp = { auto_attach = true },
            }

            vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
        end,
    },
    -- {
    --     "mfussenegger/nvim-lint",
    --     event = { "VeryLazy" },
    --     config = function()
    --         require "configs.lint"
    --     end,
    -- },
    -- {
    --     "folke/trouble.nvim",
    --     cmd = "Trouble",
    --     config = function()
    --         require("trouble").setup()
    --     end,
    --     keys = {
    --         {
    --             "<leader>xx",
    --             "<cmd>Trouble diagnostics toggle<cr>",
    --             desc = "Diagnostics (Trouble)",
    --         },
    --         {
    --             "<leader>xX",
    --             "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    --             desc = "Buffer Diagnostics (Trouble)",
    --         },
    --         {
    --             "<leader>cs",
    --             "<cmd>Trouble symbols toggle focus=false<cr>",
    --             desc = "Symbols (Trouble)",
    --         },
    --         {
    --             "<leader>cl",
    --             "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    --             desc = "LSP Definitions / references / ... (Trouble)",
    --         },
    --         {
    --             "<leader>xL",
    --             "<cmd>Trouble loclist toggle<cr>",
    --             desc = "Location List (Trouble)",
    --         },
    --         {
    --             "<leader>xQ",
    --             "<cmd>Trouble qflist toggle<cr>",
    --             desc = "Quickfix List (Trouble)",
    --         },
    --     },
    -- },
    -- {
    --     "mfussenegger/nvim-dap",
    --     keys = {
    --         {
    --             "<leader>db",
    --             "<cmd>DapToggleBreakpoint<CR>",
    --             desc = "Add Breakpoint at line",
    --         },
    --         {
    --             "<leader>dr",
    --             "<cmd>DapContinue<CR>",
    --             desc = "Start or continue the debugger",
    --         },
    --     },
    -- },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "mfussenegger/nvim-dap",
    --     },
    --     opts = {
    --         handlers = {},
    --         ensure_installed = {
    --             "codelldb",
    --         },
    --     },
    -- },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     event = "VeryLazy",
    --     dependencies = "mfussenegger/nvim-dap",
    --     configs = function()
    --         local dap = require "dap"
    --         local dapui = require "dapui"
    --         require("dapui").setup()
    --         dap.listeners.after.event_initialized["dapui_config"] = function()
    --             dapui.open()
    --         end
    --         dap.listeners.before.event_terminated["dapui_config"] = function()
    --             dapui.close()
    --         end
    --         dap.listeners.before.event_exited["dapui_config"] = function()
    --             dapui.close()
    --         end
    --     end,
    -- },
}
