# things to fix, test, explore, improve

<!-- FIX: -->

<!-- TEST: -->

- 'jose-elias-alvarez/typescript.nvim'

- NeoTree (lazyvim config)

- https://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
  - let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"
  - nnoremap cn \*``cgn
  - nnoremap cN \*``cgN
  - vnoremap <expr> cn g:mc . "``cgn"
  - vnoremap <expr> cN g:mc . "``cgN"

<!-- PERF: -->

- null-ls config
  - check all filetypes

<!-- NOTE: -->

- learn folds
