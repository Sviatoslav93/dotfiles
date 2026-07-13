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
    -- Lua helper library
    { "nvim-lua/plenary.nvim", lazy = true },

    -- Better textobjects
    {
      "echasnovski/mini.ai",
      version = "*",
      opts = {},
    },

    -- Arguments
    {
      "vim-scripts/argtextobj.vim",
      lazy = false,
    },

    -- Surround (uses s, sa, sd, sr)
    {
      "echasnovski/mini.surround",
      version = "*",
      opts = {
        mappings = {
          add = "<leader>sa",
          delete = "<leader>sd",
          replace = "<leader>sr",
          find = "<leader>sf",
          find_left = "<leader>sF",
          highlight = "<leader>sh",
          update_n_lines = "<leader>sn",
        },
      },
    },

    -- Flash (ONLY on leader, no conflicts)
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      },
    },

    -- Comments (gc)
    {
      "numToStr/Comment.nvim",
      event = "VeryLazy",
      opts = {},
    },
  },
  {
    checker = { enabled = false },
  })
