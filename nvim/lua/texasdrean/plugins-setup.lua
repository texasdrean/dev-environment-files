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

    use("sainnhe/gruvbox-material")     -- preferred colorscheme

    use("numToStr/Comment.nvim")        -- comment lines 

    use("nvim-tree/nvim-tree.lua")      -- file explorer
    use("nvim-tree/nvim-web-devicons")  -- devicons

    use("nvim-lualine/lualine.nvim")    -- statusline


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)

