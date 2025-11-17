local keymap = vim.keymap

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- Save and quit
keymap.set("n", "q", ":q<CR>")
keymap.set("n", "Q", ":qa<CR>")
keymap.set("n", "<C-w>", ":wa<CR>")
keymap.set("n", "<C-s>", ":w<CR>")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Move line up or down
keymap.set("n", "<C-down>", ":m .+1<CR>==") -- move line up(n)
keymap.set("n", "<C-up>", ":m .-2<CR>==") -- move line down(n)
keymap.set("v", "<C-down>", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap.set("v", "<C-up>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "<A-left>", "<C-w>h")
keymap.set("", "<A-up>", "<C-w>k")
keymap.set("", "<A-down>", "<C-w>j")
keymap.set("", "<A-right>", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+<")
keymap.set("n", "<C-w><down>", "<C-w>-<")

keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})

keymap.set("n", ";w", "<Cmd>:MCstart<CR>")
keymap.set("n", ";W", "<Cmd>:MCvisual<CR>")

-- PLUGING HOTKEYS
keymap.set("n", ";z", "<cmd>:ZenMode<CR>")
--keymap.set('n', ':', '<cmd>:FineCmdline<CR>')

-- Telescope
