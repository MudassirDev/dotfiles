local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Create a new augroup for your autocmds
local my_autocmds = augroup('MyAutocmds', { clear = true })

-- Autocmd to automatically format on save for certain file types
autocmd('BufWritePre', {
  group = my_autocmds,
  pattern = { '*.lua', '*.py', '*.js' },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})

-- Autocmd to set filetype specific options (example for Markdown)
autocmd('FileType', {
  group = my_autocmds,
  pattern = 'markdown',
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
