-- path config
CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

-- built-in config
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartcase = true
opt.expandtab = true

opt.splitright = true
opt.splitbelow = true
--opt.undodir
--opt.undofile


-- color config
opt.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme kanagawa]])

-- map leaders
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.maplocalleader = ";"
vim.api.nvim_set_keymap("n", ";", "<NOP>", { noremap = true, silent = true })

-- leader bindings
vim.api.nvim_set_keymap("n", "<Leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bp", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bs", ":Telescope buffers<CR>", { noremap = true, silent = true })
-- TODO kill buffer

vim.api.nvim_set_keymap("n", "<Leader>dh", ":Explore ~<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dp", ":Explore ~/projects<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>fd", ":lua require(\"telescope.builtin\").find_files({cwd=\"$XDG_CONFIG_HOME/dotfiles\", hidden=true})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fgb", ":Telescope git_branches<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fgc", ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fG", ":Telescope git_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fj", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fl", ":lua require(\"telescope.builtin\").find_files({cwd=\"%:p:h\"})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fs", ":Telescope live_grep<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>G", ":Neogit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gc", ":Git commit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gf", ":Git fetch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ghs", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ghn", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ghp", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ghr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ghs", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gp", ":Git pull<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gP", ":Git push<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gs", ":Telescope git_status<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>gS", ":Gitsigns stage_buffer<CR>", { noremap = true, silent = true })

--vim.api.nvim_set_keymap("n", "<Leader>h", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<Leader>j", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<Leader>k", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<Leader>l", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
--TODO: FIXME
vim.api.nvim_set_keymap("n", "L", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", ":bprevious<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>n", ":set number!<CR> :set relativenumber!<CR>", { noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>oc", ":edit ~/.config/dotfiles/.config/nvim/lua/config.lua<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- lua line setup
opt.laststatus = 3

-- git signs setup
require('gitsigns').setup()

require'nvim-tree'.setup()

-- netrw config
vim.g.netrw_banner = 0
-- TODO: find out why lua hates this string
vim.cmd([[let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$']])
vim.api.nvim_set_keymap("n", "-", ":Explore<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "_", ":Lexplore<CR>", { noremap = true, silent = true })
vim.cmd([[
  autocmd FileType netrw nmap <buffer> h -
  autocmd FileType netrw nmap <buffer> l <CR>
]])

-- telescope config
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    },

    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  }
}
require("telescope").load_extension("ui-select")
require('telescope').load_extension('fzf')

-- tree sitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

-- autopairs set up
local npairs = require('nvim-autopairs')
npairs.setup {}
_G.cmp_npairs_cr = function ()
  return npairs.autopairs_cr()
end

vim.api.nvim_set_keymap("i", "<cr>", "v:lua.cmp_npairs_cr()", {expr = true, noremap = true})

require('lint').linters_by_ft = {
  clojure = {'clj-kondo',}
}

--TODO: FIXME vim.cmd([[au BufWritePost <buffer> clojure require('lint').try_lint()]])

-- automatically source tmux.conf after saving
-- TODO: add one for all zsh files
vim.cmd([[augroup tmux_save | au!
    autocmd BufWritePost tmux.conf !tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf
augroup end]])
