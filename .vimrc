command! Pj execute executable('fixjson') ? '%!fixjson' : '%!python3 -m json.tool'
set number
set tabstop=2
set shiftwidth=4
set expandtab
