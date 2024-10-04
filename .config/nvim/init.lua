vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.o.wrap = false
vim.o.winbar = " "
vim.o.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
-- vim.opt.colorcolumn = "120"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.scriptencoding = "UTF-8"
vim.opt.encoding = "UTF-8"
vim.opt.fileencoding = "UTF-8"
vim.opt.smarttab = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append { "**" }
vim.opt.wildignore:append { "*/node_modules/*" }
vim.opt.termguicolors = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.formatoptions:append { "r" }
vim.opt.backup = false
vim.opt.swapfile = false
