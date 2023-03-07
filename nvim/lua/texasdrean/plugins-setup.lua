local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()  -- true if packer was just installed

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")       -- packer itself
    use("nvim-lua/plenary.nvim")        -- lua functions that many plugins use

    -- colorscheme
    use("sainnhe/gruvbox-material")     

    -- comment lines
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- vs-code like icons
    use("nvim-tree/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")           -- allow nvim-cmp to recommend text from the current buffer (source)
    use("hrsh7th/cmp-path")             -- allow nvim-cmp to recommend directories or files from the current buffer (source)

    -- snippets
    use("L3MON4D3/LuaSnip")             -- snippet engin
    use("saadparwaiz1/cmp_luasnip")     -- allow nvim-cmp to show snippets on autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets


    -- fuzzy finding
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })   -- dependency for better sorting performance
    use("BurntSushi/ripgrep")                                           -- required to live_grep to work on telescope

    if packer_bootstrap then
        require("packer").sync()
    end
end)

