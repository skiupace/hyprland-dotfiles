local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        php = { "prettier" },
    },
    formatters = {
        prettier = {
            prepend_args = {
                "--single-quote",
                "--bracket-same-line",
                "--tab-width",
                "4",
            },
        },
    },
    -- format_on_save = {
    --     -- These options will be passed to conform.format()
    --     timeout_ms = 500,
    --     lsp_fallback = true,
    -- },
}

require("conform").setup(options)
