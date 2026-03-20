---
title: "装上这只鸭子Yazi，Claude Code的文件管理丝滑到让我当场嘎嘎叫"
source: "https://x.com/BruceBlue/status/2033467538529714385"
author:
  - "[[Unknown]]"
published: 2026-03-14
created: 2026-03-16
description:
tags:
  - "clippings"
---
哇哦～首先得狠狠感谢大家对Ghostty的介绍&教程这么喜爱！

昨天，有位热心网友 [@jacklondon778](https://x.com/@jacklondon778) 在评论区回复：“你还缺一个文件管理器呀：yazi”

![图像](https://pbs.twimg.com/media/HDgX9j-agAAHrPB?format=png&name=large)

感谢网友给我提供的灵感！

我心想“行吧，试试看”，结果装完一用……我直接原地喊出声：“这也太会了吧？！”今天就来手把手带大家一起“养鸭子”！这篇文章，**5分钟你就能让你的Ghostty变成Claude Code项目的作战室**，文件管理再也不卡Vibe Coding的节奏！

> 顺便说一句：Yazi超级独立，不一定要搭Ghostty！换iTerm2、WezTerm、Kitty甚至普通Terminal都照样飞起，核心功能完全不受影响。只是搭配Ghostty的原生图像协议时，预览会更丝滑～所以随便你怎么玩！

- Yazi 官网：[https://yazi-rs.github.io/](https://yazi-rs.github.io/)Yazi 官网： [https://yazi-rs.github.io/](https://yazi-rs.github.io/)

## Claude Code用户最真实痛点

Ghostty里Cmd+D啪的一声左右分屏，左边Claude Code像开了挂一样疯狂吐代码，右边你想快速切项目、看图片、预览PDF……结果呢？还在老老实实敲：

```plaintext
cd ../../my-project && ls -la
```

或者气得切到Finder把整个流打断？更气人的是：想直接Cmd+V粘贴一张截图给Claude Code，Ghostty经常没反应（Claude网页/App却能秒传）。终端Claude输出像洪水猛兽，但是文件管理却像老牛拉车，效率直接腰斩！

现在好了，**Yazi** **🦆**来了：Rust写的终端文件管理器，异步IO拉满，预览变态强，和Ghostty原生图像协议无缝贴合，完美补齐我AI编程的最后一公里！

![图像](https://pbs.twimg.com/media/HDhKWdxagAAJhbi?format=jpg&name=large)

图1：Yazi刚启动的干净界面，左右三栏一目了然，鸭子管家已就位！

## 为什么Yazi 🦆这么香？（三大杀手级好处）

1. **快到犯规**：全异步多线程，万级文件目录秒开，大图视频PDF预览零卡顿。以前ls卡半天，现在啪一下就出来了！
2. **美到犯规**：代码高亮 + 原生图片/视频/PDF/SVG预览，搭上Catppuccin主题，和我Ghostty紫色配置直接灵魂融合，颜值直接拉满天花板。
3. **丝滑到犯规**：支持zoxide智能跳转、fzf秒搜、多标签页、批量操作，退出还能自动cd到当前目录。Claude左边写，Yazi右边管，完美多任务不翻车！

## 3分钟安装（macOS通用版，有无Ghostty都行！复制粘贴就爽）

**Yazi安装完全独立**，不管你现在用Ghostty还是iTerm2、WezTerm、Kitty、甚至macOS自带Terminal，都用同一个命令！

> ⚠️注意：Yazi跟Ghostty最搭配，直接用Terminal或者别的工具，可能会有各种各样的小bug。

- **先确保Homebrew最新：**

```bash
brew update
```

- **一键安装Yazi + 全功能依赖（预览+视频+搜索全开）：**

```bash
brew install yazi ffmpeg-full ffmpegthumbnailer sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick-full chafa font-symbols-only-nerd-font
```

## 强烈推荐添加“智能启动器”（超级实用！以后永远只敲 y 就行）

这个小函数的作用是：让你输入 **y** 就能启动Yazi，而且**按 q 退出后会自动 cd 到你最后浏览的文件夹**（这才是真正的丝滑体验！再也不用手动敲一堆 cd 了）

**最简单操作方式（推荐新手直接复制粘贴，3秒搞定）：**

- **一次性追加到配置文件**（直接复制下面整段命令，回车执行）：

```bash
cat >> ~/.zshrc << 'EOF'

# === Yazi 智能启动器 ===
# 输入 y 启动Yazi，退出后自动 cd 到当前目录
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
EOF
```

- **刷新配置（让改动立即生效）：**

```bash
source ~/.zshrc
```

- **立即测试：在任意终端输入 y ，小鸭子应该立刻出现啦！（按 q 退出后看终端是不是自动跳到你刚才浏览的文件夹了？）**
- **想手动编辑的话（进阶用户）：**

```bash
nano ~/.zshrc
```

把上面的“function y() { ... }”整段粘贴到文件最底部，然后保存退出（Ctrl+O → 回车 → Ctrl+X）。

安全小贴士：第一次操作前建议备份一下：

```bash
cp ~/.zshrc ~/.zshrc.backup
```

搞定后，以后就永远用 **y** 启动鸭子，比直接打 yazi 舒服太多！

**小彩蛋**：如果你还没装Ghostty，但想体验最丝滑的图像预览？也超简单：

```bash
brew install --cask ghostty
```

装完直接打开，用上面一样的 y 命令就行～

## 打磨好的现成配置（Catppuccin主题配置一键上身）

我已经帮大家全部优化好了，和Ghostty紫色完美搭！

- **先创建配置目录：**

```bash
mkdir -p ~/.config/yazi
```

- **一键安装Catppuccin Mocha主题（最推荐，和Ghostty最搭）：**

```bash
ya pkg add yazi-rs/flavors:catppuccin-mocha
```

- 主题颜色激活（最重要！很多人卡在这里）：

```bash
cat > ~/.config/yazi/theme.toml << 'EOF'
[flavor]
dark = "catppuccin-mocha"
light = "catppuccin-mocha"
EOF
```

- **我的优化版布局 + 高清预览终极配置（图片/PDF/视频锐利+滚动丝滑）**：

```bash
cat > ~/.config/yazi/yazi.toml << 'EOF'
[manager]
ratio = [1, 3, 4]
show_hidden = true
sort_by = "modified"
linemode = "size"
scroll_offset = 15

[preview]
max_width = 8192
max_height = 8192
image_quality = 100
image_filter = "lanczos3"
cache_enabled = true
EOF
```

验证配置是否写入成功（重要！只复制下面这行，不要带任何说明文字）：

```bash
cat ~/.config/yazi/yazi.toml
```

立马生效：

```bash
yazi --clear-cache
```

- **让配置生效（必须操作！）**
1. 按 q 完全退出当前Yazi窗口
2. 重新输入 y 打开：紫色Catppuccin Mocha主题立刻上线！

> Ghostty专属福利：在Terminal里鼠标移动会误触发rename/shell，但在Ghostty却不会！

![图像](https://pbs.twimg.com/media/HDhLxtNbAAAwMVs?format=jpg&name=large)

图2：优化后的Catppuccin紫色Yazi，预览区实时刷出高清大图，代码高亮酷炫！

## 5个核心快捷键（记住了就能快乐现场）

1. **hjkl（或箭头）**：Vim式飞奔导航，像在丝绸上滑行一样顺！
2. **Enter / o**：进入文件夹或打开文件（图片/视频直接播放）
3. **Space**：选中文件（多选），y复制、x剪切、p粘贴
4. **t**：新建标签页（多任务神器）
5. **s / S / z**：快速搜索 + zoxide历史跳转

> 额外彩蛋：r重命名、d丢进垃圾桶、f过滤、/全局查找。按?随时呼出完整帮助菜单。

## 快乐现场（真实使用画面 + Ghostty贴图解决办法）

想象一下这个画面：

Ghostty里Cmd+D啪地左右分屏，左边：Yazi紫色小鸭子，你用hjkl潇洒管理Claude项目文件，预览区实时高清展示图片、代码、PDF、甚至视频缩略图； 右边：Claude疯狂输出最新代码，你看一眼Yazi预览就能直接复制粘贴。

**额外福利**：Ghostty怎么粘贴？

- 截图后先存文件（桌面或项目文件夹），然后用Yazi（按y）找到文件，路径直接扔给Claude。

现在我每天就是这么“鬼混开发”，效率和快乐指数双双爆表！

![图像](https://pbs.twimg.com/media/HDhPcrSagAAKVeJ?format=jpg&name=large)

图3：Ghostty Cmd+D分屏真实现场，👻+🦆生产力直接起飞！

## 闭眼想象 + 行动召唤

从今天起，你的Ghostty不再是单纯的终端，而是**Claude Code的完整指挥中心**！👻幽灵开发者大军又多了一只神级小鸭子 🦆～

**快去复制上面的命令试试吧！** 3分钟上手，图片/PDF/视频高清、滚动丝滑、鼠标再也不误触！

装完记得回来评论你的“”时刻，或者分享你自己的自定义配置～

最后想问问大家：**你们还用过哪些终端神器？**（比如lf、ranger、更好的预览插件，还是别的Claude Code专用黑科技？）欢迎在评论区疯狂安利我！下一个爆款我们继续一起搞～

[#Yazi](https://x.com/search?q=%23Yazi&src=hashtag_click) [#Ghostty](https://x.com/search?q=%23Ghostty&src=hashtag_click) [#ClaudeCode](https://x.com/search?q=%23ClaudeCode&src=hashtag_click)[#Yazi](https://x.com/search?q=%23Yazi&src=hashtag_click) [#Ghostty](https://x.com/search?q=%23Ghostty&src=hashtag_click) [#ClaudeCode](https://x.com/search?q=%23ClaudeCode&src=hashtag_click) PS：如果还不了解Ghostty的话可以看之前的，🙏

> 3月14日