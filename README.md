# vi_ba_li_bak

本仓库是用于快速在linux中搭建c++ vim开发环境：

1.auto_tags 目录中的脚本用于定时生成tags文件

2.gen_tags_cscope脚本用于生成tags和cscope文件

3.bashrc文件使用:
   用软链接把~/.bashrc（最好先备份~/.bashrc）链接到当前的bashrc，即执行：ln -s bashrc ~/.bashrc

4.vim插件:
  (1)将 vim_plug文件夹复制成~/.vim
  (2)用软链接把~/.vimrc 链接到当前的vimrc，即执行: ln -s vimrc ~/.vimrc
  (3)用vim随便打开一个文件，执行:PluginInstall

   备注：用的是Vundle来管理vim插件,教程:https://www.jianshu.com/p/1839f1fb3f08
   vim_plug文件夹放的是Vundle.vim插件和cpp源文件（用于生成tags文件）
