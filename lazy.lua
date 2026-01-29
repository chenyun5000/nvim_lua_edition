-- 1. 自动安装 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- 2. 插件列表
require("lazy").setup({
 
  -- 🎨 主题
  { "scottmckendry/cyberdream.nvim" },
 
  -- 📊 状态栏
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
 
  -- 🌲 文件树
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
 
  -- tmux 窗口跳转
  { "christoomey/vim-tmux-navigator" },
 
  -- 🌈 Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
 
  -- 🧱 LSP
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    "neovim/nvim-lspconfig",
  },
 
  -- 🤖 自动补全
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
 
  -- 💬 注释
  { "numToStr/Comment.nvim", opts = {} },
 
  -- 🔧 括号自动补全
  { "windwp/nvim-autopairs", opts = {} },
 
  -- 📑 buffer 栏
  { "akinsho/bufferline.nvim" },
 
  -- 🌱 Git 提示
  { "lewis6991/gitsigns.nvim" },
 
  -- 🔍 Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "Telescope", -- 仅在调用命令时加载
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "实时全局搜索" },
    }
  },

  vim.keymap.set('n', 'gd', function()
    require('telescope.builtin').lsp_definitions({
        offset_encoding = 'utf-8'
    })
  end),
})
