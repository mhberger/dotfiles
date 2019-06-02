" See http://stackoverflow.com/questions/21112972/macvim-gets-all-settings-from-vimrc-but-not-the-colors-and-i-have-to-source
"
" See https://stackoverflow.com/a/48908399
" /Applications/MacVim.app/Contents/Resources/vim/vimrc
" /Applications/MacVim.app/Contents/Resources/vim/gvimrc
"
hi clear
if exists("syntax_on")
    syntax reset
endif
" let g:colors_name = "mhb_colors"

" Ensure that end of line markers are shown as gray
" See http://stackoverflow.com/questions/903934/unable-to-make-gray-eol-character-by-vimrc
" Needs to be in .gvimrc for macvim
" Needs to be somewhere else for vim and neovim now. Something to do with
" color schemes
" http://stackoverflow.com/questions/21112972/macvim-gets-all-settings-from-vimrc-but-not-the-colors-and-i-have-to-source
" colorscheme solarized8_flat
" Colorscheme does not work in colors file. See help colorscheme
" colorscheme solarized8_high
runtime colors/solarized8_high.vim
hi NonText ctermfg=7 guifg=gray
hi SpecialKey ctermfg=7 guifg=gray
