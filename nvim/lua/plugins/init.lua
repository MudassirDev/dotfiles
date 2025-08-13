-- Install Lazy.nvim if it's not already installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define and load your plugins
require('lazy').setup({
  'folke/tokyonight.nvim',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
    },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    }
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
          snippet = {
              expand = function(args)
                  luasnip.lsp_expand(args.body)
              end,
          },
          mapping = cmp.mapping.preset.insert({
              ['<C-Space>'] = cmp.mapping.complete(),                   -- Manually trigger completion
              ['<Tab>'] = cmp.mapping.select_next_item(),               -- Next item
              ['<S-Tab>'] = cmp.mapping.select_prev_item(),             -- Prev item
              ['<CR>'] = cmp.mapping.confirm({ select = true }),        -- Confirm selection
          }),
          sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "luasnip" },
              { name = "buffer" },
              { name = "path" },
          }),
      })
    end,
  },
})

-- set colorscheme
vim.cmd.colorscheme('tokyonight')
