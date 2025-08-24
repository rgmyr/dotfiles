-- Bootstrap Packer
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
  
  local packer_bootstrap = ensure_packer()
  
  -- Packer configuration
  require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	
	-- Essential plugins
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'numToStr/Comment.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'lewis6991/gitsigns.nvim'
	--use 'nvim-autopairs/autopairs.nvim'
	
	if packer_bootstrap then
	  require('packer').sync()
	end
  end)