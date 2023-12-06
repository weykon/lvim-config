-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- for Key
local HOME = os.getenv("HOME")
dofile( HOME .. "/.config/lvim/variables.lua")
vim.env.OPENAI_API_KEY = OPENAI_API_KEY

vim.opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 4            -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.wrap = true               -- wrap lines

-- 不同模式下的光标
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- 开启的正则
vim.opt.incsearch = true

-- 搜索时候的光标定位
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- 复制粘贴
vim.keymap.set("x", "<leader>p", "\"_dP") -- 把当前选择替换为粘贴板上的
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- 折叠代码
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- 删除的内容丢黑洞
vim.keymap.set("n","d","\"_d")
vim.keymap.set("v","d","\"_d")

vim.opt.termguicolors = true
-- vim.opt.colorcolumn = '80' -- 这个对于业务前端的代码来讲简直笑话。
 
lvim.transparent_window = true
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.colorscheme = "morning"

lvim.plugins = {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { 'ThePrimeagen/vim-be-good' },
  { 'lunarvim/colorschemes' },
  { 'mg979/vim-visual-multi' },
  {
    -- ChatGPT
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  -- {'ThePrimeagen/harpoon', config = function ()
  --   require('harpoon')
  -- end}
}

-- for Github Copilot
table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()           -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
      require("copilot_cmp").setup()       -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
    end, 100)
  end,
})

lvim.builtin.which_key.mappings["gf"] = {
  name = "ChatGPT",
  d = { "<cmd>ChatGPT<CR>", "ChatGPT" },
  e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
  g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
  t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
  k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
  -- d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
  a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
  o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
  s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
  f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
  x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
  r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
  l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
}

-- Telescope new layout settings
-- lvim.builtin.telescope.defaults.layout_config = {
--     width = 0.90,
--     height = 0.85,
--     preview_cutoff = 120,
--     prompt_position = "bottom",
--     horizontal = {
--       preview_width = function(_, cols, _)
--         return math.floor(cols * 0.6)
--       end,
--     },
--     vertical = {
--       width = 0.9,
--       height = 0.95,
--       preview_height = 0.5,
--     },

--     flex = {
--       horizontal = {
--         preview_width = 0.9,
--       },
--     },
--   }
--   lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
