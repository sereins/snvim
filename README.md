#### 基本目录结构的说明


```text
ftplugin   -- 针对每种语言的配置目录
  ---php.lua

lua
    --basic   针对neovim的配置
       autocmd.lua
       keybinds.lua
       settings.lua
    --plugins  // 针对插件的配置


    lazy.lua  // 针对lazy插件管理器的配置

init.lua      // neovim 启动的加载文件

```

需要安装的字体
https://github.com/ryanoasis/nerd-fonts#option-3-install-script;
并在iterm中进行配置
配置的案例:https://github.com/FledgeXu/NeovimZero2Hero

#### 关于setup的配置。 
其可以是子字符串也可以是一个tabel

