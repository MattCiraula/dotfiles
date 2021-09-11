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
--opt.ignorcase = true
opt.termguicolors = true

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- map leaders
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.maplocalleader = ";"
vim.api.nvim_set_keymap("n", ";", "<NOP>", { noremap = true, silent = true })

-- netrw config
vim.api.nvim_set_keymap("n", "-", ":Explore<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "_", ":Vexplore<CR>", { noremap = true, silent = true })
vim.cmd([[
  autocmd FileType netrw nmap <buffer> h -
  autocmd FileType netrw nmap <buffer> l <CR>
]])

-- fzf config
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fd", ":Files $XDG_CONFIG_HOME/dotfiles/.config<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ff", ":Files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":GFiles<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", ":History<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fl", ":BLines<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fm", ":Marks<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fs", ":Rg <CR>", { noremap = true, silent = true })

-- fugitive config
vim.api.nvim_set_keymap("n", "<Leader>gs", ":Git<CR>", { noremap = true, silent = true })

-- tree sitter config
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- lsp config
require'lspconfig'.clojure_lsp.setup{}

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
