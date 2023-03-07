vim.g.mapleader = " "

local keymap = vim.keymap   --for consiseness

-- keymap.set ("{vim mode}", "<leader>{custom keybind}, "{action}", "{options(optional)}")

--          :digraphs to see all available digraphs 
-- <CR>     :   Enter
-- <ESC>    :   Escape
-- <C>      :   Control

-- general keymaps
keymap.set ("i", "<leader>jk", "<ESC>")        -- come back to normal mode
keymap.set ("n", "<leader>nh", ":nohl<CR>")    -- cancel the search

keymap.set ("n", "<leader>+", "<C-a>")         -- increment a number
keymap.set ("n", "<leader>-", "<C-x>")         -- decrement a number

-- split windows
keymap.set ("n", "<leader>wv", "<C-w>v")       -- split window verticaly
keymap.set ("n", "<leader>wh", "<C-w>s")       -- split window horizontaly
keymap.set ("n", "<leader>we", "<C-w>=")       -- make split windows equal width
keymap.set ("n", "<leader>wx", ":close<CR>")   -- close current splited window 

keymap.set ("n", "<leader>wl", "<C-w>h")       -- move to the right window
keymap.set ("n", "<leader>wr", "<C-w>l")       -- move to the left window 
keymap.set ("n", "<leader>wd", "<C-w>j")       -- move to the window up
keymap.set ("n", "<leader>wu", "<C-w>k")       -- move to the window below

keymap.set ("n", "<leader>to", ":tabnew<CR>")  -- move to the window below

-- telescope
keymap.set ("n", "<leader>ff", "<cmd>Telescope find_files<cr>")     -- find files on current working directory, respects .gitignore 
keymap.set ("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")      -- find string on current working directory as you type
keymap.set ("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")    -- find string under cursor in current working directory
keymap.set ("n", "<leader>fb", "<cmd>Telescope buffers<cr>")        -- 
keymap.set ("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")      -- lists available help tags and opens a new window with the relevant help info on <cr>

-- nvim-tree
keymap.set ("n", "<leader>e", ":NvimTreeToggle<Cr>")   -- opens file manager
