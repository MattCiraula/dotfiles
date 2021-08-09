CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.cursorline = true
--opt.ignorcase = true
opt.termguicolors = true
opt.wrap = false
opt.termguicolors = true

vim.g.colors_name = "gruvbox"

-- map leader to space
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

local actions = require "telescope.actions"

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Esc>"] = actions.close,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Esc>"] = actions.close,
      }
    }
  }
})

-- telescope config
vim.api.nvim_set_keymap("n", "<Leader>sf", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>sg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>sb", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gb", ":Telescope git_branches<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gc", ":Telescope git_commits<CR>", { noremap = true, silent = true })

-- netrw commands
vim.api.nvim_set_keymap("n", "_", ":Vexplore<CR>", { noremap = true, silent = true })
vim.cmd([[
  autocmd FileType netrw nmap <buffer> h -
  autocmd FileType netrw nmap <buffer> l <CR>
]])

-- window commands

vim.api.nvim_set_keymap("n", "<C-v>", ":wincmd v<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":wincmd s<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", { noremap = true, silent = true })
