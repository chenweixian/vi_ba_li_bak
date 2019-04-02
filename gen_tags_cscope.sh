#!/bin/sh
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++
find -regextype "posix-egrep" -regex ".*\.(h|hpp|cpp)$" > cscope.files
cscope -Rbq
