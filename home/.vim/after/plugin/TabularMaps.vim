if !exists(':Tabularize') || get(g:, 'no_default_tabular_maps', 0)
  finish " Tabular.vim wasn't loaded or the default maps are unwanted
endif

let s:save_cpo = &cpo
set cpo&vim

AddTabularPattern 1, /^[^,]*\zs,/l1c1l0

let &cpo = s:save_cpo
unlet s:save_cpo
