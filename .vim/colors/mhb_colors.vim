"
"
" Call path to get the right color settings in both terminal and window.
"   terminal vim call path
"     .vimrc ->
"       mhb_colors_terminal ->
"         mhb_colors ->
"           solarized8_high ->
"         macvim
"
"   macOs window
"     .gvimrc ->
"       mhb_colors ->
"        solarized8_high

" Resources
"   See https://stackoverflow.com/a/48908399
"   /Applications/MacVim.app/Contents/Resources/vim/vimrc
"   /Applications/MacVim.app/Contents/Resources/vim/gvimrc
"
"   Ensure that end of line markers are shown as gray
"   See http://stackoverflow.com/questions/903934/unable-to-make-gray-eol-character-by-vimrc
"
"   http://stackoverflow.com/questions/21112972/macvim-gets-all-settings-from-vimrc-but-not-the-colors-and-i-have-to-source
"
"   colorscheme does not work in a colors file. So to build off other color
"   schemes, have to  use runtime to  invoke the colors script. See help colorscheme
"
hi clear
if exists("syntax_on")
    syntax reset
endif
"
runtime colors/solarized8_high.vim
hi NonText ctermfg=7 guifg=gray
hi SpecialKey ctermfg=7 guifg=gray
