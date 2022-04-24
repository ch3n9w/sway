# ch4ser 的私人配置
本仓库用于备份个人配置文件
![](./image/first.png)

## zsh
使用powerlevel10k,并自定义一些快捷键比如ranger的打开等

## Alacritty
使用solarized主题和Jetbrain Nerd Font字体,profile文件已经给出

## sway
- 同时使用了数字区和最下面一排字母按键来用于工作区切换, 方便了手指操作

**没有配置通知,因为不喜欢被打扰**

## waybar
including:
- cpu
- ram
- temprature
- network
- 7 workspace
- book search
- volumn
- battery status
- date
- clock
## ranger
- ranger devicon plugin 负责显示文件图标,同时个性化了部分图标
- 使用fzf & ag 来在ranger下进行模糊文件查找,
    - 在ranger中按下f开始从当前目录开始进行模糊查找
    - 在ranger中按Ctrl-h显示隐藏文件后再按f可以从当前目录开始对包含隐藏目录在内的所有目录开始模糊查找.
    - 具体参考 https://github.com/ranger/ranger/wiki/Custom-Commands#fzf-integration


## Neovim

```
.
├── init.lua                // 主文件
├── lua
│   ├── base
│   │   └── init.lua        // 基础配置
│   ├── keymap
│   │   └── init.lua        // 自定义键位
│   └── plugins
│       ├── edit
│       │   └── init.lua    // 编辑用的插件，比如括号自动补全，特色注释等等
│       ├── init.lua        // packer在这个文件中会导入其他几个插件并加载
│       ├── interface
│       │   └── init.lua    // 界面插件，比如顶部栏，底部栏，缩进线等等
│       ├── lsp
│       │   └── init.lua    // lsp 语法补全插件
│       ├── sideview
│       │   └── init.lua    // 侧边栏使用的插件，文件树和项目代码结构
│       └── theme
│           └── init.lua    // 主题文件
├── plugin
│   └── packer_compiled.lua // 这个packer.nvim自动生成的，不用管
```



如果有人想不开想要使用我的配置文件的话，安装步骤如下
- 安装packer.nvim 
- 进入lua/plugins/init.lua,将以下代码注释
```
edit_plugins.load()
interface_plugins.load()
sideview_plugins.load()
theme_plugins.load()
lsp_plugins.load()
```
- 保存后,将项目内的文件移到配置文件目录下，比如在我的archlinux上面是~/.config/nvim/
- 打开neovim运行PackerInstall
- 将刚刚注释的代码解除注释
- 保存，重新打开就行了

在neovim中呼出终端
![](./image/2021-12-23-14-46-23.png)

模糊文件查找
![](./image/2021-12-23-14-45-36.png)

代码补全
![](./image/2021-12-23-14-50-58.png)
