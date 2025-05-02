local null_ls = require('null_ls')

local opts = {
    sources = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
    }
}
return opts
