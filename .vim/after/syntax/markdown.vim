
" clear the red blobs that appear if we use underscores between words
syntax clear markdownError

" Another option is 
" syntax match markdownIgnore "\w\@<=_\w\@=" transparent contains=NONE
" syntax cluster markdownInline add=markdownIgnore
