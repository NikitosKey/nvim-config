local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Neo tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    -- Theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    -- LSP
    { 'neovim/nvim-lspconfig' },
    {'hrsh7th/cmp-nvim-lsp-signature-help'}, {
        'linrongbin16/lsp-progress.nvim',
        event = {'VimEnter'},
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('lsp-progress').setup() end
    },
    -- Autocomplete
    { 'hrsh7th/cmp-nvim-lsp' }, { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' }, { 'hrsh7th/cmp-cmdline' }, { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' }, { 'hrsh7th/vim-vsnip' }, 
    -- Mason
    { "williamboman/mason.nvim" },
    -- Telescope
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- Toggleterm 
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    -- Dashboard
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    -- bufferline
    {"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},
    {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
        require'window-picker'.setup()
    end,
    },
    -- DAP
    { 'mfussenegger/nvim-dap' },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    { "julianolf/nvim-dap-lldb", dependencies = { "mfussenegger/nvim-dap" },},
    -- Autopairs
    {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    },
    -- Gitsigns
    { 'lewis6991/gitsigns.nvim' },
    -- Whichkey
    {
        "folke/which-key.nvim",
        version = '2.*',
        event = "VeryLazy",
    },
    -- Markdown-preview
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
    -- Database UI 
    {
      'kristijanhusak/vim-dadbod-ui',
      dependencies = {
        { 'tpope/vim-dadbod', lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql', 'sqllite' }, lazy = true }, -- Optional
      },
      cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
      },
    },
    {"zbirenbaum/copilot.lua"},
    {"zbirenbaum/copilot-cmp"},
    {'onsails/lspkind.nvim'},
});
