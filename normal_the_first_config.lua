-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 4            -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.wrap = true               -- wrap lines
lvim.transparent_window = true
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

lvim.plugins = {
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    { 'ThePrimeagen/vim-be-good' }
}

-- for Github Copilot
table.insert(lvim.plugins, {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
        vim.defer_fn(function()
            require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
            require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
        end, 100)
    end,
})


-- ChatGPT
-- use({
--   "jackMort/ChatGPT.nvim",
--     config = function()
--       require("chatgpt").setup()
--     end,
--     requires = {
--       "MunifTanjim/nui.nvim",
--       "nvim-lua/plenary.nvim",
--       "nvim-telescope/telescope.nvim"
--     }
-- })


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
