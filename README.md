#### 基本目录结构的说明

完善阶段可能有些目录还不存在，先做一个基本的规划


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
