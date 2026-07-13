local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Dark low-contrast theme (load before other UI plugins).
  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({})
      vim.cmd.colorscheme("vague")
    end,
  },
  -- Lua helper library used by many plugins.
  { "nvim-lua/plenary.nvim",       lazy = true },
  -- Filetype icons for UI plugins.
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Statusline at the bottom of each window.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
    },
  },
  -- Popup hints for available keybindings.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- Fuzzy finder for files, text, buffers, and help.
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Seamless navigation between tmux panes and Neovim splits.
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- Visual undo history tree toggle.
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  -- Add/change/delete surrounding characters quickly.
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  -- Fast jump/search motions across the current buffer.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote flash" },
      { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter search" },
    },
  },
  -- Auto-close brackets, quotes, and pairs while typing.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- Toggle line/block comments with easy keymaps.
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = function()
      require("barbar").setup({
        animation = false, -- faster
        auto_hide = false,
        tabpages = true,
        clickable = true,
        icons = {
          buffer_index = true,
          buffer_number = false,
          button = "",
          diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true },
            [vim.diagnostic.severity.WARN]  = { enabled = true },
          },
          gitsigns = {
            added = { enabled = true },
            changed = { enabled = true },
            deleted = { enabled = true },
          },
        },
      })
    end,
  },
}, {
  checker = { enabled = false },
})
