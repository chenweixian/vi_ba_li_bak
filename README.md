# vi_ba_li_bak

本仓库是用于快速在linux中用vim作为编辑器开发c++：

1.auto_tags 目录中的脚本用于定时生成tags文件

2.gen_tags_cscope脚本用于生成tags和cscope文件

3.bashrc文件使用:
   用软链接把~/.bashrc（最好先备份~/.bashrc）链接到bashrc，即执行：ln -s bashrc ~/.bashrc

4.vim插件:
  (1)用软链接将~/.vim链接到vim_plug文件夹,文件夹软链接最好都用绝对路径，即执行如下命令:ln -s /home/cwx/vi_ba_li_bak/vim_plug /home/cwx/.vim
  (2)用软链接把~/.vimrc 链接到vimrc，即执行: ln -s vimrc ~/.vimrc
  
   备注：
   vim_plug文件夹放的是使用到的插件和cpp源文件和对应的tags文件
   如果vimrc文件中还配置了一些vim_plug没有的插件，那么可以自己安装插件:
   用vim随便打开一个文件，执行:PluginInstall
   用的是Vundle来管理vim插件,Vundle:教程:https://www.jianshu.com/p/1839f1fb3f08
                           Vundle文档:https://github.com/VundleVim/Vundle.vim/blob/master/README_ZH_CN.md
						   //test1111
						   //test333
