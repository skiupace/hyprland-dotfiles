---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',

  nvdash = {
    load_on_startup = true,
  },

  hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
        NvDashAscii = {
            fg = "blue",
            bg = "NONE",
        },
        NvDashButtons = {
            fg = "light_grey",
            bg = "NONE",
        },
    },
}
M.plugins = "custom.plugins"

return M
