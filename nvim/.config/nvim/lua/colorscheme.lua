-- vague.nvim applies the theme in lua/plugins.lua (priority 1000).
-- Fallback if the plugin is missing or :colorscheme vague fails.
local fallback = "habamax"
if vim.g.colors_name ~= "vague" then
  local ok = pcall(vim.cmd.colorscheme, "vague")
  if not ok then
    ok = pcall(vim.cmd.colorscheme, fallback)
    if not ok then
      vim.notify("Colorscheme 'vague' and fallback '" .. fallback .. "' failed.", vim.log.levels.WARN)
      pcall(vim.cmd.colorscheme, "default")
    end
  end
end

-- main editor uses terminal background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#161b22' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#30363d', bg = '#161b22' })
