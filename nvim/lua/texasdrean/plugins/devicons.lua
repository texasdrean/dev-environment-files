-- import devicons plugin safely
local setup, devicons = pcall(require, "nvim-web-devicons")
if not setup then
	return
end

-- configure/enable gitsigns
devicons.setup({
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh",
		},
	},

	color_icons = true,
	default = true,
	strict = true,

	override_by_filename = {
		[".gitignore"] = {
			icon = "",
			color = "#f1502f",
			name = "Gitignore",
		},
	},

	override_by_extension = {
		["log"] = {
			icon = "",
			color = "#81e043",
			name = "Log",
		},
	},
})
