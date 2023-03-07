local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")

if not status then
    print("Color scheme not found !")
    return
end

