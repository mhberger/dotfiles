" au BufNewFile,BufRead *.groovy  setf groovy
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.groovy setfiletype groovy
  au! BufRead,BufNewFile *.gradle setfiletype groovy
augroup END

