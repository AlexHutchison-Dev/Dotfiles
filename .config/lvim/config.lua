--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_o_save = true
lvim.colorscheme = "tokyonight"
vim.opt.colorcolumn = "100"
vim.opt.relativenumber = true
vim.opt.textwidth=100
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
}

-- Additional Plugins
lvim.plugins = {
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
  
    -- ColorScheme's
    {"folke/tokyonight.nvim"},
    {"cocopon/iceberg.vim"},
    {"arcticicestudio/nord-vim"},
    {'bluz71/vim-nightfly-guicolors'},
    {"mhartington/oceanic-next"},
    -- General Plugins
     {
         "ray-x/lsp_signature.nvim",
         config = function() require"lsp_signature".on_attach() end,
         event = "InsertEnter"
     },
        {
      "p00f/nvim-ts-rainbow",
      config = function() require"nvim-treesitter.configs".setup {
        rainbow = {
          enable = true,
          extended_mode = true,
        }
    } end,
    },
    {
      "folke/lsp-colors.nvim",
      event = "BufRead",
    },
    {
     "norcalli/nvim-colorizer.lua",
       config = function()
          require("colorizer").setup({ "*" }, {
              RGB = true, -- #RGB hex codes
              RRGGBB = true, -- #RRGGBB hex codes
              RRGGBBAA = true, -- #RRGGBBAA hex codes
              rgb_fn = true, -- CSS rgb() and rgba() functions
              hsl_fn = true, -- CSS hsl() and hsla() functions
              css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
              css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
              })
      end,
    },
-- {
--   "folke/todo-comments.nvim",
--   requires = "nvim-lua/plenary.nvim",
--   config = function()
--     require("todo-comments").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--       signs = true, -- show icons in the signs column
--   sign_priority = 8, -- sign priority
--   -- keywords recognized as todo comments
--   keywords = {
--     FIX = {
--       icon = "??? ", -- icon used for the sign, and in search results
--       color = "error", -- can be a hex color, or a named color (see below)
--       alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
--       -- signs = false, -- configure signs for some keywords individually
--     },
--     TODO = { icon = "??? ", color = "info" },
--     HACK = { icon = "??? ", color = "warning" },
--     WARN = { icon = "??? ", color = "warning", alt = { "WARNING", "XXX" } },
--     PERF = { icon = "??? ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
--     NOTE = { icon = "??? ", color = "hint", alt = { "INFO" } },
--   },
--   merge_keywords = true, -- when true, custom keywords will be merged with the defaults
--   -- highlighting of the line containing the todo comment
--   -- * before: highlights before the keyword (typically comment characters)
--   -- * keyword: highlights of the keyword
--   -- * after: highlights after the keyword (todo text)
--   highlight = {
--     before = "", -- "fg" or "bg" or empty
--     keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
--     after = "fg", -- "fg" or "bg" or empty
--     pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
--     comments_only = true, -- uses treesitter to match keywords in comments only
--     max_line_len = 400, -- ignore lines longer than this
--     exclude = {}, -- list of file types to exclude highlighting
--   },
--   -- list of named colors where we try to extract the guifg from the
--   -- list of hilight groups or use the hex color if hl not found as a fallback
--   colors = {
--     error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
--     warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
--     info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
--     hint = { "LspDiagnosticsDefaultHint", "#10B981" },
--     default = { "Identifier", "#7C3AED" },
--   },
--   search = {
--     command = "rg",
--     args = {
--       "--color=never",
--       "--no-heading",
--       "--with-filename",
--       "--line-number",
--       "--column",
--     },
--     -- regex that will be used to match keywords.
--     -- don't replace the (KEYWORDS) placeholder
--     pattern = [[\b(KEYWORDS):]], -- ripgrep regex
--     -- pattern = [[\b(KEYWORDS)
--           },
--     }
--   end,
-- },
{
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
},
    {
      "sidebar-nvim/sidebar.nvim",
      config = function() require("sidebar-nvim").setup({
          disable_default_keybindings = 0,
          bindings = nil,
          open = false,
          side = "left",
          initial_width = 35,
          update_interval = 1000,
          sections = { "datetime", "git-status", "lsp-diagnostics", "todos"},
          section_separator = "-----",
          todos = {
            ignored_paths = {'~'}, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
          }
    })
    end,
  },
{'vimwiki/vimwiki'},


}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
