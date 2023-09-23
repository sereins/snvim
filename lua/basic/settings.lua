local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Globol Settings --
global.mapleader = " "
-- 现实模式
option.showmode = false

--缩进
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
--相对行号
option.relativenumber = true
--命令模式下的命令 自动补全
option.wildmenu = true
--模糊搜索
option.hlsearch = false
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menuone", "noselect" }
-- 高亮所在行
option.cursorline = true
option.termguicolors = true
option.signcolumn = "yes"
--文件有改动自动度
option.autoread = true
option.title = true

option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "a"
-- 存储文件的编辑信息(可以回退)
--option.undofile = true
--option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')

--可以给项目单独设置nvim的配置
option.exrc = true
-- 文件换行
option.wrap = false
--打开新文件在那个位置
option.splitright = true

-- Buffer Settings --
buffer.fileenconding = "utf-8"

-- Key mappings --
--vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
--vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
--vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
--vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

--切换buffer
vim.keymap.set("n", "<A-Tab>", "<cmd>bNext<CR>")
--关闭buffer
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")

--移动行
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")
