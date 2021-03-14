set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

set number
set tabstop=4
set shiftwidth=4  " Indents will have a width of 4
set softtabstop=4 " Sets the number of columns for a TAB
set expandtab     " Expand TABs to spaces

