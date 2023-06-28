local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")

if not status then
	print("Color scheme not found !")
	return
end
