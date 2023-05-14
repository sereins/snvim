-- leader 按键配置
vim.g.mapleader = ','
-- 安装lazy插件管理工具
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--插件管理
require("lazy").setup({{import = "plugins"}})


-- 一些基本配置
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
--有关主题换颜色的配置
vim.o.termguicolors = true
--自动换行
vim.smartindent = true
--所在行高亮
vim.o.cursorline = true
