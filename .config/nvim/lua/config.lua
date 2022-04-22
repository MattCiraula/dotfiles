-- path config
CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"

-- option config
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
--opt.ignorcase = true

-- color config
opt.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

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

vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fd", ":lua require(\"telescope.builtin\").find_files({cwd=\"$XDG_CONFIG_HOME/dotfiles\", hidden=true})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fgb", ":Telescope git_branches<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fgc", ":Telescope git_commits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fgC", ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fF", ":lua require(\"telescope.builtin\").find_files({cwd=\"%:p:h\"})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope git_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fj", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fl", ":lua require(\"telescope.builtin\").find_files({cwd=\"%:p:h\"})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fm", ":Telescope marks<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fp", ":lua require(\"telescope.builtin\").find_files({cwd=\"$HOME/projects\", hidden=true})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fs", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ft", ":Telescope treesitter<CR>", { noremap = true, silent = true })

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

vim.api.nvim_set_keymap("n", "<Leader>h", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>j", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>k", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>l", "<C-w>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>n", ":set number!<CR> :set relativenumber!<CR>", { noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>oc", ":edit ~/.config/dotfiles/.config/nvim/lua/config.lua<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>;a", ":Telescope lsp_code_actions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>;d", ":Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>;i", ":Telescope lsp_implementations<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>;r", ":Telescope lsp_references<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>:", ":!clj -M:fmt<CR>", { noremap = true, silent = true })

-- lua line setup
require('lualine').setup {
  options = {
    component_separators = {left = '', right = ''},
    section_separators = { left = '', right = '' },
  },
}
opt.laststatus = 3

-- git signs setup
require('gitsigns').setup()

-- netrw config
vim.g.netrw_banner = 0
vim.cmd([[let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$']])
vim.api.nvim_set_keymap("n", "-", ":Explore<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "_", ":Lexplore<CR>", { noremap = true, silent = true })
vim.cmd([[
  autocmd FileType netrw nmap <buffer> h -
  autocmd FileType netrw nmap <buffer> l <CR>
]])

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

-- lsp install
-- lsp config
--require'lspconfig'.bashls.setup{}
require'lspconfig'.clojure_lsp.setup{}
--require'lspconfig'.sumneko_lua.setup{}
--require'lspconfig'.zeta_note.setup{}
--require'lspconfig'.go_lsp.setup{}

-- cmp config
-- TODO: not getting completions from other files included - probably need to configure clojure lsp
local cmp = require'cmp'
cmp.setup({
    --[[snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },]]--
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      --elseif luasnip.expand_or_jumpable() then
       -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      --elseif luasnip.jumpable(-1) then
        --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'conjure' },
      --...
    }
})

-- automatically source tmux.conf after saving
-- TODO: add one for all zsh files
vim.cmd([[augroup tmux_save | au!
    autocmd BufWritePost tmux.conf !tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf
augroup end]])

-- vimwiki config
--vim.api.nvim_exec([[
--let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown'}]]],
--false)
