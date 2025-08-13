local map = vim.keymap.set

-- general keymaps
map("n", "<leader><leader>x", "<cmd>so<CR>")
map("n", "<leader>x", ":.lua<CR>")
map("v", "<leader>x", ":lua<CR>")
map("n", "<leader>dd", "<cmd>Ex<CR>")

-- for Visual Line mode to move lines
map('v', 'J', ':m \'>+1<CR>gv=gv', opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fd', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- for harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
  settings = {
    ui_nav_wrap = true,
  },
})
-- REQUIRED

vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader><Tab>", function()
  require("harpoon"):list():next({ ui_nav_wrap = true })
end, { desc = "Cycle to next Harpoon file (wrap)" })

-- for cmp
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
